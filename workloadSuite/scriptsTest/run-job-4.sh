hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-4.txt workGenOutputTest-4 1.5258789E-5 160.12402 >> workGenLogs/job-4.txt 2>> workGenLogs/job-4.txt 
hadoop dfs -rmr workGenOutputTest-4
# inputSize 67108864
