hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-13.txt workGenOutputTest-13 1.5258789E-5 1.0 >> workGenLogs/job-13.txt 2>> workGenLogs/job-13.txt 
hadoop dfs -rmr workGenOutputTest-13
# inputSize 67108864
