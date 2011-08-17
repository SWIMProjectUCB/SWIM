hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-0.txt workGenOutputTest-0 5.810261E-4 0.26818323 >> workGenLogs/job-0.txt 2>> workGenLogs/job-0.txt 
hadoop dfs -rmr workGenOutputTest-0
# inputSize 67108864
