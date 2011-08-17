hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-35.txt workGenOutputTest-35 1.5258789E-5 67.74121 >> workGenLogs/job-35.txt 2>> workGenLogs/job-35.txt 
hadoop dfs -rmr workGenOutputTest-35
# inputSize 67108864
