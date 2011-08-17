hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-31.txt workGenOutputTest-31 0.7998113 8.2158303E-4 >> workGenLogs/job-31.txt 2>> workGenLogs/job-31.txt 
hadoop dfs -rmr workGenOutputTest-31
# inputSize 67108864
