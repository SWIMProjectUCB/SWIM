../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00009,workGenInput/part-00002 workGenOut-job19 0.574622 3.951307E-4 >> ../output/job-19.txt 2>> ../output/job-19.txt 
../bin/hadoop dfs -rmr workGenOut-job19
# inputSize 79607743
