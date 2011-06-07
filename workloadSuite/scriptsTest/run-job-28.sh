../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00002 workGenOut-job28 7.812679E-5 0.435247 >> ../output/job-28.txt 2>> ../output/job-28.txt 
../bin/hadoop dfs -rmr workGenOut-job28
# inputSize 67108864
