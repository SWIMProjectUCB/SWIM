hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 5 inputPath-job-34.txt workGenOutputTest-34 1.5258789E-5 304735.12 >> workGenLogs/job-34.txt 2>> workGenLogs/job-34.txt 
hadoop dfs -rmr workGenOutputTest-34
# inputSize 67108864
