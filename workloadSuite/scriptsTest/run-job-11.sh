../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00000 workGenOut-job11 1.5258789E-5 1.0 >> ../output/job-11.txt 2>> ../output/job-11.txt 
../bin/hadoop dfs -rmr workGenOut-job11
# inputSize 67108864
