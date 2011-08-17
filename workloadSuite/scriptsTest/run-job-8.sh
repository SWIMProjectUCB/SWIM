hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-8.txt workGenOutputTest-8 6.606579E-4 0.21064146 >> workGenLogs/job-8.txt 2>> workGenLogs/job-8.txt 
hadoop dfs -rmr workGenOutputTest-8
# inputSize 67108864
