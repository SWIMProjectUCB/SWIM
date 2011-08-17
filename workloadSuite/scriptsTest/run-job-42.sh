hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-42.txt workGenOutputTest-42 1.5258789E-5 35321.98 >> workGenLogs/job-42.txt 2>> workGenLogs/job-42.txt 
hadoop dfs -rmr workGenOutputTest-42
# inputSize 67108864
