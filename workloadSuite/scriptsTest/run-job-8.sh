../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00008 workGenOut-job8 6.606579E-4 0.21064146 >> ../output/job-8.txt 2>> ../output/job-8.txt 
../bin/hadoop dfs -rmr workGenOut-job8
# inputSize 67108864
