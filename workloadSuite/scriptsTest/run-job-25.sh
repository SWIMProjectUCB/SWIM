hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-25.txt workGenOutputTest-25 0.011125132 1.6002492 >> workGenLogs/job-25.txt 2>> workGenLogs/job-25.txt 
hadoop dfs -rmr workGenOutputTest-25
# inputSize 67108864
