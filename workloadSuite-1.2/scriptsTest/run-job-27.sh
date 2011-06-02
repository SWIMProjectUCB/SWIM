../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00001 workGenOut-job27 0.0018562526 0.10764143 >> ../output/job-27.txt 2>> ../output/job-27.txt 
../bin/hadoop dfs -rmr workGenOut-job27
# inputSize 67108864
