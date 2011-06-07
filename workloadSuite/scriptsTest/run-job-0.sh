../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00005 workGenOut-job0 5.810261E-4 0.26818323 >> ../output/job-0.txt 2>> ../output/job-0.txt 
../bin/hadoop dfs -rmr workGenOut-job0
# inputSize 67108864
