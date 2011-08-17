hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 4 inputPath-job-17.txt workGenOutputTest-17 1.2676634 0.2764548 >> workGenLogs/job-17.txt 2>> workGenLogs/job-17.txt 
hadoop dfs -rmr workGenOutputTest-17
# inputSize 171246518
