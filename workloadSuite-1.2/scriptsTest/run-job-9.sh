../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00004 workGenOut-job9 5.8835745E-4 0.4086972 >> ../output/job-9.txt 2>> ../output/job-9.txt 
../bin/hadoop dfs -rmr workGenOut-job9
# inputSize 67108864
