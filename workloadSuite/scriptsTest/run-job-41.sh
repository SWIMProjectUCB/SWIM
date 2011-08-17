hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-41.txt workGenOutputTest-41 1.5258789E-5 1.0 >> workGenLogs/job-41.txt 2>> workGenLogs/job-41.txt 
hadoop dfs -rmr workGenOutputTest-41
# inputSize 67108864
