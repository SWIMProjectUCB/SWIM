../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 6 workGenInput/part-00009 workGenOut-job40 1.5258789E-5 419971.2 >> ../output/job-40.txt 2>> ../output/job-40.txt 
../bin/hadoop dfs -rmr workGenOut-job40
# inputSize 67108864
