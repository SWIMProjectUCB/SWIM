../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00004 workGenOut-job1 4.223287E-4 0.2541811 >> ../output/job-1.txt 2>> ../output/job-1.txt 
../bin/hadoop dfs -rmr workGenOut-job1
# inputSize 67108864
