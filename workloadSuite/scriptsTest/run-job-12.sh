hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-12.txt workGenOutputTest-12 5.777925E-4 0.02640877 >> workGenLogs/job-12.txt 2>> workGenLogs/job-12.txt 
hadoop dfs -rmr workGenOutputTest-12
# inputSize 67108864
