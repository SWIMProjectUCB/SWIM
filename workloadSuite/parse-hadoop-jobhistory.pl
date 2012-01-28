#!/usr/bin/perl

# Log Parger for Hadoop jobHistory files

################################################################
#
# Copyright (c) 2011, Regents of the University of California.
# All rights reserved.
#
# This file is governed by the "New BSD License" below.
#
#
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions 
# are met:
#
# * Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of the University of California, Berkeley
# nor the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.
#
################################################################


use List::Util qw[min max];
use Digest::MD5 qw(md5 md5_hex md5_base64);

$historyDir = $ARGV[0];

opendir(my $HIST_DIR, $historyDir);
#my @directory_contents = readdir(HIST_DIR);
#closedir(HIST_DIR);

my %jobs = {};
my $files = 0;

#foreach my $dentry ( @directory_contents ) {

while  (
	defined( my $dentry = readdir $HIST_DIR )
	) {

    #if (!($dentry =~ /^*conf*/) && !($dentry =~ /^*crc/)) {
    $files++;

    if ($files % 5000 == 0) {
	print STDERR $files . "\n";
    }
    if (!($dentry =~ /^*crc/)) {
	#print "$historyDir\/$dentry\n";

	$file = "$historyDir\/$dentry";
	open (FILE, $file);
	$total_map_time = 0;
	$total_reduce_time = 0;
	$submit_time = 0;
	$launch_time = 0;
	$finish_time = 0;
	my $status = "";
	my $job_id = "";
	my $job_name="";
	my $map_input_bytes = 0;
	my $shuffle_bytes = 0;
	my $red_output_bytes = 0;
	my $map_input_bytes_per_record = 0;
	my $red_output_records = 0;

	#my %tasks = {};
	#my %jobs = {};

	#if (1==2) {
	while (<FILE>) {
	        
	    
	    chomp;
	    ($line) = split("\n");
	    
	    
	    if($dentry =~ /job_(\d+)_(\d+)_conf.xml/) {
		$job_id = "job_" . $1 . "_" . $2;
		$jobs{$job_id}{"checkedPaths"} = 1;

                if($line =~ /\<property\>(.*?)\<name\>mapred\.input\.dir\<\/name\>\<value\>(.*?)\<\/value\>\<\/property\>/)
                {
                    $jobs{$job_id}{"input_dir"} = md5_hex($2);
                }
                if($line =~ /\<property\>(.*?)\<name\>mapred\.output\.dir\<\/name\>\<value\>(.*?)\<\/value\>\<\/property\>/)
                {
                    $jobs{$job_id}{"output_dir"} = md5_hex($2);
                }
	    }
	        
	    if($line =~ /Job JOBID="(\S+)"/) {
		$job_id = $1;
		$jobs{$job_id}{"checkedStats"} = 1;
		
		if($line =~ /JOBNAME="(.*?)"/)
		{
		    $jobs{$job_id}{"job_name"} = $1;
		}
		if ($line =~ /SUBMIT_TIME="(\d+)"/) {
		    $jobs{$job_id}{"submit_time"} = $1;
		}

		if ($line =~ /LAUNCH_TIME="(\d+)"/) {
		    $jobs{$job_id}{"launch_time"} = $1;
		}

		if ($line =~ /FINISH_TIME="(\d+)"/) {
		    $jobs{$job_id}{"finish_time"} = $1;
		}
		
		if($line =~ /TOTAL_MAPS\="(\d+)"/) {
		    $jobs{$job_id}{"maps"} = $1;
		}
		if ($line =~ /TOTAL_REDUCES\="(\d+)"/) {
		    $jobs{$job_id}{"reduces"} = $1;
		}

		if ($line =~ /JOB_STATUS="(\w+)"/) {
		    $jobs{$job_id}{"status"} = $1;
		}

                if ($line =~ /\(HDFS_BYTES_READ\)\((\d+)\)/) {
                    $jobs{$job_id}{"map_input_bytes"} = $1;
                }

                if ($line =~ /\(Map input records\)\((\d+)\)/) {
		    if ($1>0) {
			$jobs{$job_id}{"map_input_bytes_per_record"} = $jobs{$job_id}{"map_input_bytes"} / $1;
		    } 
		}

                if ($line =~ /\(Map output records\)\((\d+)\)/) {
                    $jobs{$job_id}{"shuffle_bytes"} = $1 * $jobs{$job_id}{"map_input_bytes_per_record"};
                }

                if ($line =~ /\(HDFS_BYTES_WRITTEN\)\((\d+)\)/) {
                    $jobs{$job_id}{"red_output_bytes"} = $1;
                }

		if ($line =~ /\(Map output bytes\)\((\d+)\)/) {
                    $jobs{$job_id}{"shuffle_bytes"} = $1;
                }

		
	    }
	    
	    if ($line =~ /Task TASKID="(\S+)"/)
	    {
		$task_id = $1;
		
		if($line =~ /TASK_TYPE="(\w+)"/) { 
		    $jobs{$job_id}{"tasks"}{$task_id}{"task_type"} = $1;
		}
		if ($line =~ /START_TIME="(\d+)"/) {
		    $jobs{$job_id}{"tasks"}{$task_id}{"start_time"} = $1;
		}


		if($line =~ /TASK_TYPE="(\w+)"/) {  
		    $jobs{$job_id}{"tasks"}{$task_id}{"type"} = $1;
	        }
		if($line =~ /TASK_STATUS="(\w+)"/) {
		    #$status = $1;
		    $jobs{$job_id}{"tasks"}{$task_id}{"status"} = $1;
		}
		if($line =~ /FINISH_TIME="(\d+)"/) {
		    $jobs{$job_id}{"tasks"}{$task_id}{"end_time"} = $1;
		}
		$jobs{$job_id}{"tasks"}{$task_id}{"execution_time"} = $jobs{$job_id}{"tasks"}{$task_id}{"end_time"} - $jobs{$job_id}{"tasks"}{$task_id}{"start_time"};


		if ($jobs{$job_id}{"tasks"}{$task_id}{"type"} =~ /MAP/ and $jobs{$job_id}{"tasks"}{$task_id}{"status"} =~ /SUCCESS/) {
		    $jobs{$job_id}{"total_map_time"} += $jobs{$job_id}{"tasks"}{$task_id}{"execution_time"};
		}
		if ($jobs{$job_id}{"tasks"}{$task_id}{"type"} =~ /REDUCE/ and $jobs{$job_id}{"tasks"}{$task_id}{"status"} =~ /SUCCESS/) {
		    $jobs{$job_id}{"total_reduce_time"} += $jobs{$job_id}{"tasks"}{$task_id}{"execution_time"};
		    if($line =~ /\(HDFS_BYTES_WRITTEN\)\((\d+)\)/) {
			$jobs{$job_id}{"red_output_bytes"} += $1;
		    }
		    if($line =~ /\(Reduce output records\)\((\d+)\)/) {
			$jobs{$job_id}{"red_output_records"} += $1;
		    }
		}
		
	    }
			
		
	                 
	}
	close (FILE);
	if ($jobs{$job_id}{"status"} =~ /SUCCESS/) { 
	    if ($jobs{$job_id}{"red_output_bytes"} == 0 && $jobs{$job_id}{"red_output_records"} > 0) {
		$jobs{$job_id}{"red_output_bytes"} = $jobs{$job_id}{"red_output_records"} * $jobs{$job_id}{"map_input_bytes_per_record"};
	    }
	    if ($jobs{$job_id}{"reduces"} ==0 && $jobs{$job_id}{"red_output_bytes"} == 0) {
		$jobs{$job_id}{"red_output_bytes"} = $jobs{$job_id}{"shuffle_bytes"};
		$jobs{$job_id}{"shuffle_bytes"} = 0;
            }
	    #print 
		#"$job_id\t$job_name\t$map_input_bytes\t$shuffle_bytes\t$red_output_bytes\t" . ($submit_time / 1000) . "\t" . 
		#(($finish_time - $launch_time) / 1000) . "\t" . ($total_map_time/1000) . "\t" . 
		#($total_reduce_time/1000 ) . "\t" . (($total_map_time + $total_reduce_time) / 1000) . "\t$maps\t$reduces";
	    #print "\n";
	} else {

	}

	if (defined($jobs{$job_id}{"checkedPaths"}) && defined($jobs{$job_id}{"checkedStats"}) && $jobs{$job_id}{"status"} =~ /SUCCESS/) {
	    print
		"$job_id\t" .
		$jobs{$job_id}{"job_name"} . "\t" .
		$jobs{$job_id}{"map_input_bytes"} . "\t" .
		$jobs{$job_id}{"shuffle_bytes"} . "\t" .
		$jobs{$job_id}{"red_output_bytes"} . "\t" .
		($jobs{$job_id}{"submit_time"} / 1000) . "\t" .
		(($jobs{$job_id}{"finish_time"} - $jobs{$job_id}{"launch_time"}) / 1000) . "\t" .
		($jobs{$job_id}{"total_map_time"} /1000) . "\t" .
		($jobs{$job_id}{"total_reduce_time"} /1000 ) . "\t" .
		(($jobs{$job_id}{"total_map_time"} + $jobs{$job_id}{"total_reduce_time"}) / 1000) . "\t" .
		$jobs{$job_id}{"maps"} . "\t" .
		$jobs{$job_id}{"reduces"} . "\t" .
		$jobs{$job_id}{"input_dir"} . "\t" .
		$jobs{$job_id}{"output_dir"};
	    print "\n";
	    delete($jobs{$job_id});
	}
	
    }
}

#exit; 

foreach $job_id (keys %jobs) {
    if ($jobs{$job_id}{"status"} =~ /SUCCESS/) {
	print
	    "$job_id\t" . 
	    $jobs{$job_id}{"job_name"} . "\t" . 
	    $jobs{$job_id}{"map_input_bytes"} . "\t" . 
	    $jobs{$job_id}{"shuffle_bytes"} . "\t" . 
	    $jobs{$job_id}{"red_output_bytes"} . "\t" . 
	    ($jobs{$job_id}{"submit_time"} / 1000) . "\t" .
	    (($jobs{$job_id}{"finish_time"} - $jobs{$job_id}{"launch_time"}) / 1000) . "\t" . 
	    ($jobs{$job_id}{"total_map_time"} /1000) . "\t" .
	    ($jobs{$job_id}{"total_reduce_time"} /1000 ) . "\t" . 
	    (($jobs{$job_id}{"total_map_time"} + $jobs{$job_id}{"total_reduce_time"}) / 1000) . "\t" . 
	    $jobs{$job_id}{"maps"} . "\t" . 
	    $jobs{$job_id}{"reduces"} . "\t" . 
	    $jobs{$job_id}{"input_dir"} . "\t" . 
	    $jobs{$job_id}{"output_dir"};
	print "\n";
    }
}

closedir($HIST_DIR);

exit;
