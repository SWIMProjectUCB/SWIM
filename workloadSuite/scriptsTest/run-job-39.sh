hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 2 inputPath-job-39.txt workGenOutputTest-39 1.5258789E-5 143652.4 >> workGenLogs/job-39.txt 2>> workGenLogs/job-39.txt 
hadoop dfs -rmr workGenOutputTest-39
# inputSize 67108864
