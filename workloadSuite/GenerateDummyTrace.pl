#!/usr/bin/perl                                                                                                      
use strict;
use warnings;
use Getopt::Long;
use Date::Parse;
use POSIX;

my $seedPath    = undef;
my $outPrefix = undef;
my $count    = undef;

my $cmdline_result = GetOptions("seedPath=s"     => \$seedPath, 
				"outPrefix=s"     => \$outPrefix,
				"count=i"     => \$count
				);

my @seed_data = ();

close(INPUT_FILE);
open(INPUT_FILE, "< $seedPath") or die "Cannot open $seedPath";

my $seedSize = 0;
while (<INPUT_FILE>) {

    #if (($dataSize % 100000) == 0) { print "read line \#" . $dataSize . "\n"; }

    chomp;
    my $line = $_;
    my @fields = split(/[ \t]+/, $line);

    $seed_data[$seedSize][0] = $fields[0];   # unique_job_id
    $seed_data[$seedSize][1] = $fields[1];   # job_name
    $seed_data[$seedSize][2] = $fields[2];   # map_input_bytes
    $seed_data[$seedSize][3] = $fields[3];   # shuffle_bytes
    $seed_data[$seedSize][4] = $fields[4];   # reduce_output_bytes
    $seed_data[$seedSize][5] = $fields[5];   # submit_time_seconds
    $seed_data[$seedSize][6] = $fields[6];    # duration_seconds
    $seed_data[$seedSize][7] = $fields[7];   # map_time_task_seconds
    $seed_data[$seedSize][8] = $fields[8];   # red_time_task_seconds
    $seed_data[$seedSize][9] = $fields[9];  # total_time_task_seconds
    $seed_data[$seedSize][10] = $fields[10];  # map task count
    $seed_data[$seedSize][11] = $fields[11];  # reduce task count
    $seed_data[$seedSize][12] = $fields[12];  # input path
    $seed_data[$seedSize][13] = $fields[13];  # output path

    $seedSize++;

}

#print "total lines " . $dataSize . "\n";

close(INPUT_FILE);

expand_and_print($seedPath, $outPrefix);

sub expand_and_print {

    my ($seed_path, $out_prefix) = @_;

	# truncate previously existing file and open new one for append
    close(OUTPUT_FILE);
	open(OUTPUT_FILE, "> $out_prefix\_$count\.tsv") or die "Cannot open $out_prefix\_$count\.tsv";
	close(OUTPUT_FILE);
	open(OUTPUT_FILE, ">> $out_prefix\_$count\.tsv") or die "Cannot open $out_prefix\_$count\.tsv";

    my $traceStart = $seed_data[0][5];
    my $offset = 0;

	my $jobNumber = 0;
    for (my $i=0; $i<$count/$seedSize; $i++) {
		
	    # repeat and print

        for (my $j=0; $j<$seedSize; $j++) {

	        my $submitTime = $offset + $seed_data[$j][5];

		    print OUTPUT_FILE $jobNumber . "\t";
		    print OUTPUT_FILE "job" . $jobNumber . "\t";
		    print OUTPUT_FILE $seed_data[$j][2] . "\t";
		    print OUTPUT_FILE $seed_data[$j][3] . "\t";
		    print OUTPUT_FILE $seed_data[$j][4] . "\t";
		    print OUTPUT_FILE $submitTime . "\t";
		    print OUTPUT_FILE $seed_data[$j][6] . "\t";
		    print OUTPUT_FILE $seed_data[$j][7] . "\t";
		    print OUTPUT_FILE $seed_data[$j][8] . "\t";
		    print OUTPUT_FILE $seed_data[$j][9] . "\t";
		    print OUTPUT_FILE $seed_data[$j][10] . "\t";
		    print OUTPUT_FILE $seed_data[$j][11] . "\t";
		    if (defined($seed_data[$j][12])) {
                print OUTPUT_FILE $seed_data[$j][12] . "\t";
            }
            if (defined($seed_data[$j][13])) {
                print OUTPUT_FILE $seed_data[$j][13] . "\t";
            }
            print OUTPUT_FILE "\n";

		    $jobNumber++;
	    }

		$offset = $offset + $seed_data[$seedSize - 1][5] - $traceStart + 100;
	} 

	close(OUTPUT_FILE);

} # end sub sample_and_print

