hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-36.txt workGenOutputTest-36 1.5258789E-5 4410.825 >> workGenLogs/job-36.txt 2>> workGenLogs/job-36.txt 
hadoop dfs -rmr workGenOutputTest-36
# inputSize 67108864
