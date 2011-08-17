hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-20.txt workGenOutputTest-20 1.5258789E-5 1.0 >> workGenLogs/job-20.txt 2>> workGenLogs/job-20.txt 
hadoop dfs -rmr workGenOutputTest-20
# inputSize 67108864
