hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-11.txt workGenOutputTest-11 1.5258789E-5 1.0 >> workGenLogs/job-11.txt 2>> workGenLogs/job-11.txt 
hadoop dfs -rmr workGenOutputTest-11
# inputSize 67108864
