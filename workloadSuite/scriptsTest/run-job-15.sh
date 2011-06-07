../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00000 workGenOut-job15 2.7373433E-5 0.55743057 >> ../output/job-15.txt 2>> ../output/job-15.txt 
../bin/hadoop dfs -rmr workGenOut-job15
# inputSize 67108864
