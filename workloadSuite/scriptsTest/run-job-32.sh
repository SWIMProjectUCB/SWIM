../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00006 workGenOut-job32 1.5258789E-5 1.0 >> ../output/job-32.txt 2>> ../output/job-32.txt 
../bin/hadoop dfs -rmr workGenOut-job32
# inputSize 67108864
