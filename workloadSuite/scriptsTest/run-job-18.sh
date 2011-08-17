hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-18.txt workGenOutputTest-18 1.5258789E-5 1.0 >> workGenLogs/job-18.txt 2>> workGenLogs/job-18.txt 
hadoop dfs -rmr workGenOutputTest-18
# inputSize 67108864
