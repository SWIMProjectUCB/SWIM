hadoop jar WorkGen.jar org.apache.hadoop.examples.WorkGen -conf /usr/lib/hadoop-0.20.2/conf/workGenKeyValue_conf.xsl -r 1 inputPath-job-44.txt workGenOutputTest-44 1.5258789E-5 5607.967 >> workGenLogs/job-44.txt 2>> workGenLogs/job-44.txt 
hadoop dfs -rmr workGenOutputTest-44
# inputSize 67108864
