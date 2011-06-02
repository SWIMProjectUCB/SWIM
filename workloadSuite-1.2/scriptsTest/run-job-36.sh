../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00006 workGenOut-job36 1.5258789E-5 4410.825 >> ../output/job-36.txt 2>> ../output/job-36.txt 
../bin/hadoop dfs -rmr workGenOut-job36
# inputSize 67108864
