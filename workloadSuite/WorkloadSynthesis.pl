#!/usr/bin/perl                                                                                                      
use strict;
use warnings;
use Getopt::Long;
use Date::Parse;
use POSIX;

my $inPath    = undef;
my $outPrefix = undef;
my $repeats   = undef;
my $samples   = undef;
my $length    = undef;

my $traceStart = undef;
my $traceEnd   = undef;

my $cmdline_result = GetOptions("inPath=s"     => \$inPath, 
				"outPrefix=s"  => \$outPrefix, 
				"repeats=i"    => \$repeats, 
				"samples=i"    => \$samples, 
				"length=i"     => \$length, 
				"traceStart=i" => \$traceStart,
				"traceEnd=i"   => \$traceEnd   );

my @all_data = ();

close(INPUT_FILE);
open(INPUT_FILE, "< $inPath") or die "Cannot open $inPath";

my $dataSize = 0;
while (<INPUT_FILE>) {

    #if (($dataSize % 100000) == 0) { print "read line \#" . $dataSize . "\n"; }

    chomp;
    my $line = $_;
    my @fields = split(/\t/, $line);

    $all_data[$dataSize][0] = $fields[0];   # unique_job_id
    $all_data[$dataSize][1] = $fields[1];   # job_name
    $all_data[$dataSize][2] = $fields[2];   # map_input_bytes
    $all_data[$dataSize][3] = $fields[3];   # shuffle_bytes
    $all_data[$dataSize][4] = $fields[4];   # reduce_output_bytes
    $all_data[$dataSize][5] = $fields[5];   # submit_time_seconds
    $all_data[$dataSize][6] = $fields[6];   # duration_seconds
    $all_data[$dataSize][7] = $fields[7];   # map_time_task_seconds
    $all_data[$dataSize][8] = $fields[8];   # red_time_task_seconds
    $all_data[$dataSize][9] = $fields[9];   # total_time_task_seconds
    $all_data[$dataSize][10] = $fields[12]; # input path
    $all_data[$dataSize][11] = $fields[13]; # output path
    
    $dataSize++;

}

#print "total lines " . $dataSize . "\n";

close(INPUT_FILE);

sample_and_print($inPath, $outPrefix);

sub sample_and_print {

    my ($in_path, $out_prefix) = @_;

    for (my $i=0; $i<$repeats; $i++) {
		
	my $j = 0;
	my $startPoint = 0;
	my $remainder = 0;

	my $jobNumber = 0;
	my $timeSoFar = 0;

	my %inputHash = ();
	my %outputHash = ();

	# truncate previously existing file and open new one for append

	close(OUTPUT_FILE);
	open(OUTPUT_FILE, "> $out_prefix\_$i") or die "Cannot open $out_prefix\_$i";
	close(OUTPUT_FILE);
	open(OUTPUT_FILE, ">> $out_prefix\_$i") or die "Cannot open $out_prefix\_$i";

	# sample and print

	for ($j=0; $j<$samples; $j++) {

	    my $startTime = $traceStart + rand() * ($traceEnd - $traceStart - $length);
	    my $endTime = $startTime + $length;

            # book keeping ...

            my $prev = $startTime - $remainder;
            $remainder = $length + $remainder;

	    # binary search to find index of first job with job submit time >= $startTime

	    my $min = 0;
	    my $max = $dataSize - 1;
	    my $mid = $min + floor(($max - $min)/2);

	    while (($min <= $max) && ($all_data[$mid][5] != $startTime)){
		$mid = $min + floor(($max - $min)/2);
		if ($startTime >= ($all_data[$mid][5])) {
		    $min = $mid + 1;
		} else {
		    $max = $mid - 1;
		}
	    }

	    # print out workload

	    for (my $k=$mid; $all_data[$k][5] <= $endTime; $k++) {

		if ($all_data[$k][5] >= $startTime && $all_data[$k][5] <= $endTime) {

		    $timeSoFar += ($all_data[$k][5] - floor($prev));

		    print OUTPUT_FILE "job" . $jobNumber . "\t";
		    print OUTPUT_FILE $timeSoFar . "\t";
		    print OUTPUT_FILE ($all_data[$k][5] - floor($prev)) . "\t"; # inter-job time gap seconds
		    print OUTPUT_FILE $all_data[$k][2] . "\t";
		    print OUTPUT_FILE $all_data[$k][3] . "\t";
		    print OUTPUT_FILE $all_data[$k][4] . "\t";
		    
                    # print anonymized input path if info available, else print TAB
		    if (defined($all_data[$k][10])) {
			my $inputPath = $all_data[$k][10];
			if (defined($inputHash{$inputPath})) {
			    $inputPath = $inputHash{$inputPath};
			} else {
			    $inputHash{$inputPath} = scalar(keys( %inputHash ));
			    $inputPath =  scalar(keys( %inputHash ));
			}
			$inputPath = "inputPath" . $inputPath;
			print OUTPUT_FILE $inputPath . "\t";
		    } else {
			print OUTPUT_FILE "\t";
		    }
		    
		    # print anonymized output path if info available, else print TAB
		    if (defined($all_data[$k][11])) {
			my $outputPath = $all_data[$k][11];
                        if (defined($outputHash{$outputPath})) {
                            $outputPath = $outputHash{$outputPath};
                        } else {
                            $outputHash{$outputPath} = scalar(keys( %outputHash ));
                            $outputPath =  scalar(keys( %outputHash ));
                        }
                        $outputPath = "outputPath" . $outputPath;
			print OUTPUT_FILE $outputPath . "\t";
		    } else {
                        print OUTPUT_FILE "\t";
                    }
		    
		    print OUTPUT_FILE "\n";

		    $prev = $all_data[$k][5];
		    $remainder = $endTime - $all_data[$k][5];
		    $jobNumber++;
		}

	    }

	    
	} # end for ($j=0; $j<$samples; $j++)

	close(OUTPUT_FILE);

    } # end for (my $i=0; $i<$repeats; $i++)

} # end sub sample_and_print

