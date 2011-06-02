../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00005 workGenOut-job7 6.368756E-5 0.2395882 >> ../output/job-7.txt 2>> ../output/job-7.txt 
../bin/hadoop dfs -rmr workGenOut-job7
# inputSize 67108864
