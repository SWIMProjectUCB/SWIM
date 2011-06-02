../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00004 workGenOut-job48 3.0110776E-4 0.050675508 >> ../output/job-48.txt 2>> ../output/job-48.txt 
../bin/hadoop dfs -rmr workGenOut-job48
# inputSize 67108864
