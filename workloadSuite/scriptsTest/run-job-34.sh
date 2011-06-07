../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 5 workGenInput/part-00009 workGenOut-job34 1.5258789E-5 304735.12 >> ../output/job-34.txt 2>> ../output/job-34.txt 
../bin/hadoop dfs -rmr workGenOut-job34
# inputSize 67108864
