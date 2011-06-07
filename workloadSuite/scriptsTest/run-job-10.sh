../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00003 workGenOut-job10 1.5258789E-5 1.0 >> ../output/job-10.txt 2>> ../output/job-10.txt 
../bin/hadoop dfs -rmr workGenOut-job10
# inputSize 67108864
