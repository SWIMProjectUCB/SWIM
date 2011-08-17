hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-5.txt workGenOutputTest-5 8.070469E-5 0.18906942 >> workGenLogs/job-5.txt 2>> workGenLogs/job-5.txt 
hadoop dfs -rmr workGenOutputTest-5
# inputSize 67108864
