../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00009 workGenOut-job24 1.5258789E-5 1.0 >> ../output/job-24.txt 2>> ../output/job-24.txt 
../bin/hadoop dfs -rmr workGenOut-job24
# inputSize 67108864
