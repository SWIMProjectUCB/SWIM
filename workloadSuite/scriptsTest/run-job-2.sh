hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-2.txt workGenOutputTest-2 1.47596E-4 0.39293286 >> workGenLogs/job-2.txt 2>> workGenLogs/job-2.txt 
hadoop dfs -rmr workGenOutputTest-2
# inputSize 67108864
