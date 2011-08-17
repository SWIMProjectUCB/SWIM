hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 2 inputPath-job-37.txt workGenOutputTest-37 1.5258789E-5 149384.83 >> workGenLogs/job-37.txt 2>> workGenLogs/job-37.txt 
hadoop dfs -rmr workGenOutputTest-37
# inputSize 67108864
