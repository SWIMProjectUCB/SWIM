../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00006 workGenOut-job45 3.1377375E-4 0.42883602 >> ../output/job-45.txt 2>> ../output/job-45.txt 
../bin/hadoop dfs -rmr workGenOut-job45
# inputSize 67108864
