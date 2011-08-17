hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-46.txt workGenOutputTest-46 1.5258789E-5 1.0 >> workGenLogs/job-46.txt 2>> workGenLogs/job-46.txt 
hadoop dfs -rmr workGenOutputTest-46
# inputSize 67108864
