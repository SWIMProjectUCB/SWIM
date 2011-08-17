hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-15.txt workGenOutputTest-15 2.7373433E-5 0.55743057 >> workGenLogs/job-15.txt 2>> workGenLogs/job-15.txt 
hadoop dfs -rmr workGenOutputTest-15
# inputSize 67108864
