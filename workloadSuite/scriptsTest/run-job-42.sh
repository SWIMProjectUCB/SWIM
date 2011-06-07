../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00000 workGenOut-job42 1.5258789E-5 35321.98 >> ../output/job-42.txt 2>> ../output/job-42.txt 
../bin/hadoop dfs -rmr workGenOut-job42
# inputSize 67108864
