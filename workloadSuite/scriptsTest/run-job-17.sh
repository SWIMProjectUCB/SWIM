../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 4 workGenInput/part-00002,workGenInput/part-00008,workGenInput/part-00007 workGenOut-job17 1.2676634 0.2764548 >> ../output/job-17.txt 2>> ../output/job-17.txt 
../bin/hadoop dfs -rmr workGenOut-job17
# inputSize 171246518
