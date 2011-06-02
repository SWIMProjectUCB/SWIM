../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00001 workGenOut-job30 7.708371E-5 0.1979509 >> ../output/job-30.txt 2>> ../output/job-30.txt 
../bin/hadoop dfs -rmr workGenOut-job30
# inputSize 67108864
