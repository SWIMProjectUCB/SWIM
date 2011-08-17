hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-7.txt workGenOutputTest-7 6.368756E-5 0.2395882 >> workGenLogs/job-7.txt 2>> workGenLogs/job-7.txt 
hadoop dfs -rmr workGenOutputTest-7
# inputSize 67108864
