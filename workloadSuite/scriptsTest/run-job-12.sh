../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00001 workGenOut-job12 5.777925E-4 0.02640877 >> ../output/job-12.txt 2>> ../output/job-12.txt 
../bin/hadoop dfs -rmr workGenOut-job12
# inputSize 67108864
