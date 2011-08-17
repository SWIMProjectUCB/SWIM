hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 2 inputPath-job-38.txt workGenOutputTest-38 1.5258789E-5 1398101.2 >> workGenLogs/job-38.txt 2>> workGenLogs/job-38.txt 
hadoop dfs -rmr workGenOutputTest-38
# inputSize 67108864
