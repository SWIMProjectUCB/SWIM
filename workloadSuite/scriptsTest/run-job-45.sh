hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-45.txt workGenOutputTest-45 3.1377375E-4 0.42883602 >> workGenLogs/job-45.txt 2>> workGenLogs/job-45.txt 
hadoop dfs -rmr workGenOutputTest-45
# inputSize 67108864
