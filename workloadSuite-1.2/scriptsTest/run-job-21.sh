../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00005 workGenOut-job21 1.5258789E-5 1.0 >> ../output/job-21.txt 2>> ../output/job-21.txt 
../bin/hadoop dfs -rmr workGenOut-job21
# inputSize 67108864
