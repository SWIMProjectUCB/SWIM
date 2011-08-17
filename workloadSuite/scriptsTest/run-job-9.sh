hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-9.txt workGenOutputTest-9 5.8835745E-4 0.4086972 >> workGenLogs/job-9.txt 2>> workGenLogs/job-9.txt 
hadoop dfs -rmr workGenOutputTest-9
# inputSize 67108864
