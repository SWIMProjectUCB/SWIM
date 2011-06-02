../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 2 workGenInput/part-00000 workGenOut-job38 1.5258789E-5 1398101.2 >> ../output/job-38.txt 2>> ../output/job-38.txt 
../bin/hadoop dfs -rmr workGenOut-job38
# inputSize 67108864
