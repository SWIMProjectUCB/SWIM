../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00001 workGenOut-job2 1.47596E-4 0.39293286 >> ../output/job-2.txt 2>> ../output/job-2.txt 
../bin/hadoop dfs -rmr workGenOut-job2
# inputSize 67108864
