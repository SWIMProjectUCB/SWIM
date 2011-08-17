hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-26.txt workGenOutputTest-26 0.001182422 0.16898338 >> workGenLogs/job-26.txt 2>> workGenLogs/job-26.txt 
hadoop dfs -rmr workGenOutputTest-26
# inputSize 67108864
