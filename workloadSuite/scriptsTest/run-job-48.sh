hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-48.txt workGenOutputTest-48 3.0110776E-4 0.050675508 >> workGenLogs/job-48.txt 2>> workGenLogs/job-48.txt 
hadoop dfs -rmr workGenOutputTest-48
# inputSize 67108864
