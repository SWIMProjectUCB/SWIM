../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00003 workGenOut-job26 0.001182422 0.16898338 >> ../output/job-26.txt 2>> ../output/job-26.txt 
../bin/hadoop dfs -rmr workGenOut-job26
# inputSize 67108864
