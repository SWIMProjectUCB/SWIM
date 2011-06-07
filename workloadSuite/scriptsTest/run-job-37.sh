../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 2 workGenInput/part-00009 workGenOut-job37 1.5258789E-5 149384.83 >> ../output/job-37.txt 2>> ../output/job-37.txt 
../bin/hadoop dfs -rmr workGenOut-job37
# inputSize 67108864
