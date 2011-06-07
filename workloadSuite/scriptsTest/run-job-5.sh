../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00009 workGenOut-job5 8.070469E-5 0.18906942 >> ../output/job-5.txt 2>> ../output/job-5.txt 
../bin/hadoop dfs -rmr workGenOut-job5
# inputSize 67108864
