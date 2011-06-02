../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00000 workGenOut-job43 0.017437875 0.29772884 >> ../output/job-43.txt 2>> ../output/job-43.txt 
../bin/hadoop dfs -rmr workGenOut-job43
# inputSize 67108864
