../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 2 workGenInput/part-00006 workGenOut-job39 1.5258789E-5 143652.4 >> ../output/job-39.txt 2>> ../output/job-39.txt 
../bin/hadoop dfs -rmr workGenOut-job39
# inputSize 67108864
