hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-27.txt workGenOutputTest-27 0.0018562526 0.10764143 >> workGenLogs/job-27.txt 2>> workGenLogs/job-27.txt 
hadoop dfs -rmr workGenOutputTest-27
# inputSize 67108864
