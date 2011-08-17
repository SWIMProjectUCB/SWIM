hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-19.txt workGenOutputTest-19 0.574622 3.951307E-4 >> workGenLogs/job-19.txt 2>> workGenLogs/job-19.txt 
hadoop dfs -rmr workGenOutputTest-19
# inputSize 79607743
