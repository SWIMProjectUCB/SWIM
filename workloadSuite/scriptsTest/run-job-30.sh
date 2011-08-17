hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-30.txt workGenOutputTest-30 7.708371E-5 0.1979509 >> workGenLogs/job-30.txt 2>> workGenLogs/job-30.txt 
hadoop dfs -rmr workGenOutputTest-30
# inputSize 67108864
