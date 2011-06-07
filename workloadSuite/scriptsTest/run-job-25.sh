../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00007 workGenOut-job25 0.011125132 1.6002492 >> ../output/job-25.txt 2>> ../output/job-25.txt 
../bin/hadoop dfs -rmr workGenOut-job25
# inputSize 67108864
