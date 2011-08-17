hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-6.txt workGenOutputTest-6 1.5258789E-5 8.972656 >> workGenLogs/job-6.txt 2>> workGenLogs/job-6.txt 
hadoop dfs -rmr workGenOutputTest-6
# inputSize 67108864
