../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00005 workGenOut-job6 1.5258789E-5 8.972656 >> ../output/job-6.txt 2>> ../output/job-6.txt 
../bin/hadoop dfs -rmr workGenOut-job6
# inputSize 67108864
