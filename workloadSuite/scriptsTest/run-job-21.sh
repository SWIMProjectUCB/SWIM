hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-21.txt workGenOutputTest-21 1.5258789E-5 1.0 >> workGenLogs/job-21.txt 2>> workGenLogs/job-21.txt 
hadoop dfs -rmr workGenOutputTest-21
# inputSize 67108864
