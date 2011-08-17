hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-28.txt workGenOutputTest-28 7.812679E-5 0.435247 >> workGenLogs/job-28.txt 2>> workGenLogs/job-28.txt 
hadoop dfs -rmr workGenOutputTest-28
# inputSize 67108864
