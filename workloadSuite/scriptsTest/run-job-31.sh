../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00003 workGenOut-job31 0.7998113 8.2158303E-4 >> ../output/job-31.txt 2>> ../output/job-31.txt 
../bin/hadoop dfs -rmr workGenOut-job31
# inputSize 67108864
