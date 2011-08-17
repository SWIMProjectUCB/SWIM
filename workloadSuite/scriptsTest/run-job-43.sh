hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-43.txt workGenOutputTest-43 0.017437875 0.29772884 >> workGenLogs/job-43.txt 2>> workGenLogs/job-43.txt 
hadoop dfs -rmr workGenOutputTest-43
# inputSize 67108864
