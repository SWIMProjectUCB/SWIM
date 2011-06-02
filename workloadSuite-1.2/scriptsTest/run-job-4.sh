../bin/hadoop jar ../WorkGen.jar org.apache.hadoop.examples.WorkGen -conf ../conf/workGenKeyValue_conf.xsl -r 1 workGenInput/part-00009 workGenOut-job4 1.5258789E-5 160.12402 >> ../output/job-4.txt 2>> ../output/job-4.txt 
../bin/hadoop dfs -rmr workGenOut-job4
# inputSize 67108864
