hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-1.txt workGenOutputTest-1 4.223287E-4 0.2541811 >> workGenLogs/job-1.txt 2>> workGenLogs/job-1.txt 
hadoop dfs -rmr workGenOutputTest-1
# inputSize 67108864
