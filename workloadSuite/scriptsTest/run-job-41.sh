../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00004 workGenOut-job41 1.5258789E-5 1.0 >> ../output/job-41.txt 2>> ../output/job-41.txt 
../bin/hadoop dfs -rmr workGenOut-job41
# inputSize 67108864
