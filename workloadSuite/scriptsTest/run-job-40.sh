hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 6 inputPath-job-40.txt workGenOutputTest-40 1.5258789E-5 419971.2 >> workGenLogs/job-40.txt 2>> workGenLogs/job-40.txt 
hadoop dfs -rmr workGenOutputTest-40
# inputSize 67108864
