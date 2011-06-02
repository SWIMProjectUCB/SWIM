../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00002 workGenOut-job16 1.5258789E-5 1.0 >> ../output/job-16.txt 2>> ../output/job-16.txt 
../bin/hadoop dfs -rmr workGenOut-job16
# inputSize 67108864
