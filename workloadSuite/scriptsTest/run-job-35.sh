../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00001 workGenOut-job35 1.5258789E-5 67.74121 >> ../output/job-35.txt 2>> ../output/job-35.txt 
../bin/hadoop dfs -rmr workGenOut-job35
# inputSize 67108864
