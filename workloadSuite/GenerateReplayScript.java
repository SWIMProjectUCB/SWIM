import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.text.SimpleDateFormat;

public class GenerateReplayScript {  

    /*
     * Workload file format constants for field indices
     */
    static final int INTER_JOB_SLEEP_TIME = 2;
    static final int INPUT_DATA_SIZE      = 3;
    static final int SHUFFLE_DATA_SIZE    = 4;
    static final int OUTPUT_DATA_SIZE     = 5;

    /*
     *
     * Parses a tab separated file into an ArrayList<ArrayList<String>>
     *
     */
    public static long parseFileArrayList(String path, 
					  ArrayList<ArrayList<String>> data 
					  ) throws Exception {
	
	long maxInput = 0;

	BufferedReader input = new BufferedReader(new FileReader(path));
	String s;
	String[] array;
	int rowIndex = 0;
	int columnIndex = 0;
	while (true) {
	    if (!input.ready()) break;
	    s = input.readLine();
	    array = s.split("\t");
	    try {
		columnIndex = 0;
		while (columnIndex < array.length) {
		    if (columnIndex == 0) {
			data.add(rowIndex,new ArrayList<String>());
		    }
		    String value = array[columnIndex];
		    data.get(rowIndex).add(value);

		    if (Long.parseLong(array[INPUT_DATA_SIZE]) > maxInput) {
			maxInput = Long.parseLong(array[INPUT_DATA_SIZE]);
		    }

		    columnIndex++;
		}
		rowIndex++;
	    } catch (Exception e) {
		
	    }
	}

	return maxInput;
	
    }

    /*
     *
     * Prints the necessary shell scripts
     *
     */
    public static void printOutput(ArrayList<ArrayList<String>> workloadData,
				   int clusterSizeRaw,
				   int clusterSizeWorkload,
				   int inputPartitionSize,
				   int inputPartitionCount, 
				   String scriptDirPath,
				   String hdfsInputDir,
				   String hdfsOutputPrefix,
				   long totalDataPerReduce, 
				   String workloadOutputDir,
				   String hadoopCommand,
				   String pathToWorkGenJar,
				   String pathToWorkGenConf) throws Exception {
	

	if (workloadData.size() > 0) {

	    long maxInput = 0;
	    String toWrite = "";

	    FileWriter runAllJobs = new FileWriter(scriptDirPath + "/run-jobs-all.sh");

	    toWrite = "#!/bin/bash\n";
	    runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
	    toWrite = "rm -r " + workloadOutputDir + "\n"; 
	    runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
	    toWrite = "mkdir " + workloadOutputDir + "\n";
            runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());

	    System.out.println();
	    System.out.println(workloadData.size() + " jobs in the workload.");
	    System.out.println("Generating scripts ... please wait ... ");
	    System.out.println();

	    int written = 0;
	    
	    for (int i=0; i<workloadData.size(); i++) {

		long sleep   = Long.parseLong(workloadData.get(i).get(INTER_JOB_SLEEP_TIME));
		long input   = Long.parseLong(workloadData.get(i).get(INPUT_DATA_SIZE));
		long shuffle = Long.parseLong(workloadData.get(i).get(SHUFFLE_DATA_SIZE));
                long output  = Long.parseLong(workloadData.get(i).get(OUTPUT_DATA_SIZE));

		// Logic to scale sleep time such that smaller cluster = fewer jobs
		// Currently not done 
		//
		// sleep   = sleep   * clusterSizeRaw / clusterSizeWorkload; 
		
		input   = input   * clusterSizeWorkload / clusterSizeRaw;
		shuffle = shuffle * clusterSizeWorkload / clusterSizeRaw;
		output  = output  * clusterSizeWorkload / clusterSizeRaw; 

		if (input > maxInput) maxInput = input;

		if (input   < 67108864) input   = 67108864;
		if (shuffle < 1024    ) shuffle = 1024    ;
		if (output  < 1024    ) output  = 1024    ;

		ArrayList<Integer> inputPartitionSamples = new ArrayList<Integer>();
		long inputCopy = input; 
		java.util.Random rng = new java.util.Random();
		int tryPartitionSample = rng.nextInt(inputPartitionCount);
		while (inputCopy > 0) {
		    boolean alreadySampled = true;
		    while (alreadySampled) {
			if (inputPartitionSamples.size()>=inputPartitionCount) {
			    System.err.println();
			    System.err.println("ERROR!");
                            System.err.println("Not enough partitions for input size of " + input + " bytes.");
			    System.err.println("Happened on job number " + i + ".");
                            System.err.println("Input partition size is " + inputPartitionSize + " bytes.");
                            System.err.println("Number of partitions is " + inputPartitionCount + ".");
			    System.err.println("Total data size is " + (((long) inputPartitionSize) * ((long) inputPartitionCount)) + " bytes < " + input + " bytes.");
			    System.err.println("Need to generate a larger input data set.");
			    System.err.println();
                            throw new Exception("Input data set not large enough. Need to generate a larger data set."); 
			    // if exception thrown here, input set not large enough - generate bigger input set
                        }
			alreadySampled = false;
		    }
		    inputPartitionSamples.add(new Integer(tryPartitionSample));
		    tryPartitionSample = (tryPartitionSample + 1) % inputPartitionCount;
		    inputCopy -= inputPartitionSize;
		}

		FileWriter inputPathFile = new FileWriter(scriptDirPath + "/inputPath-job-" + i + ".txt");
		String inputPath = "";
		for (int j=0; j<inputPartitionSamples.size(); j++) {
		    inputPath = (hdfsInputDir + "/part-" + String.format("%05d", inputPartitionSamples.get(j)));
		    if (j != (inputPartitionSamples.size()-1)) inputPath += ",";
		    inputPathFile.write(inputPath.toCharArray(), 0, inputPath.length());
		}
		inputPathFile.close();


		// write inputPath to separate file to get around ARG_MAX limit for large clusters

		inputPath = "inputPath-job-" + i + ".txt";

		String outputPath = hdfsOutputPrefix + "-" + i;

		float SIRatio = ((float) shuffle) / ((float) input  );
                float OSRatio = ((float) output ) / ((float) shuffle);

		long numReduces = -1;

		if (totalDataPerReduce > 0) {
		    numReduces = Math.round((shuffle + output) / ((double) totalDataPerReduce));
		    if (numReduces < 1) numReduces = 1;
		    if (numReduces > clusterSizeWorkload) numReduces = clusterSizeWorkload / 5;
		    toWrite =
                        "" + hadoopCommand + " jar " + pathToWorkGenJar + " org.apache.hadoop.examples.WorkGen -conf " + pathToWorkGenConf + " " +
                        "-r " + numReduces + " " + inputPath + " " + outputPath + " " + SIRatio + " " + OSRatio +
			" >> " + workloadOutputDir + "/job-" + i + ".txt 2>> " + workloadOutputDir + "/job-" + i + ".txt \n";
		} else {
		    toWrite = 
			"" + hadoopCommand + " jar " + pathToWorkGenJar + " org.apache.hadoop.examples.WorkGen -conf " + pathToWorkGenConf + " " +
			inputPath + " " + outputPath + " " + SIRatio + " " + OSRatio +
			" >> " + workloadOutputDir + "/job-" + i + ".txt 2>> " + workloadOutputDir + "/job-" + i + ".txt \n";
		}

                FileWriter runFile = new FileWriter(scriptDirPath + "/run-job-" + i + ".sh");
                runFile.write(toWrite.toCharArray(), 0, toWrite.length());
                toWrite = "" + hadoopCommand + " dfs -rmr " + outputPath + "\n";
                runFile.write(toWrite.toCharArray(), 0, toWrite.length());
                toWrite = "# inputSize " + input + "\n";
                runFile.write(toWrite.toCharArray(), 0, toWrite.length());

		runFile.close();

		// works for linux type systems only
		Runtime.getRuntime().exec("chmod +x " + scriptDirPath + "/run-job-" + i + ".sh");
		
		toWrite = "./run-job-" + i + ".sh &\n";
		runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
		

		toWrite = "sleep " + sleep + "\n";
		runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
		written++;


	    }

	    System.out.println(written + " jobs written ... done.");
	    System.out.println();

	    toWrite = "# max input " + maxInput + "\n";
	    runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
	    toWrite = "# inputPartitionSize " + inputPartitionSize + "\n";
	    runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
	    toWrite = "# inputPartitionCount " + inputPartitionCount + "\n";
            runAllJobs.write(toWrite.toCharArray(), 0, toWrite.length());
	    
	    runAllJobs.close();

	    // works for linux type systems only
	    Runtime.getRuntime().exec("chmod +x " + scriptDirPath + "/run-jobs-all.sh");

	}

    }


    /*
     *
     * Read in command line arguments etc.
     *
     */
    public static void main(String args[]) throws Exception {
	
	if (args.length < 10) {

	    System.out.println();
	    System.out.println("Insufficient arguments.");
	    System.out.println();
	    System.out.println("Usage: ");
	    System.out.println();
	    System.out.println("java GenerateReplayScript");
	    System.out.println("  [path to file with workload info]");
	    System.out.println("  [number of machines in the original production cluster]");
	    System.out.println("  [number of machines in the cluster on which the workload will be run]");
	    System.out.println("  [size of each input partition in bytes]");
	    System.out.println("  [number of input partitions]");
	    System.out.println("  [output directory for the scripts]");
	    System.out.println("  [HDFS directory for the input data]");
	    System.out.println("  [amount of data per reduce task in byptes]");
	    System.out.println("  [directory for the workload output files]");
	    System.out.println("  [hadoop command on your system]");
	    System.out.println("  [path to WorkGen.jar]");
	    System.out.println("  [path to workGenKeyValue_conf.xsl]");
	    System.out.println();

	} else {

	    // variables
	    
	    ArrayList<ArrayList<String>> workloadData = new ArrayList<ArrayList<String>>();

	    // read command line arguments

	    String fileWorkloadPath = args[0];

	    int clusterSizeRaw      = Integer.parseInt(args[1]); 
	    int clusterSizeWorkload = Integer.parseInt(args[2]); 
	    int inputPartitionSize  = Integer.parseInt(args[3]); 
	    int inputPartitionCount = Integer.parseInt(args[4]);
	    String scriptDirPath    = args[5];
	    String hdfsInputDir     = args[6];
	    String hdfsOutputPrefix = args[7];
	    long totalDataPerReduce = Long.parseLong(args[8]);
	    String workloadOutputDir = args[9];
	    String hadoopCommand = args[10];
	    String pathToWorkGenJar = args[11];
	    String pathToWorkGenConf = args[12];

	    // parse data

	    long maxInput = parseFileArrayList(fileWorkloadPath, workloadData);

	    // check if maxInput fits within input data size to be generated

	    long maxInputNeeded = maxInput * clusterSizeWorkload / clusterSizeRaw;
	    
	    if (maxInputNeeded > 
		(((long) inputPartitionSize) * ((long) inputPartitionCount))) {

		System.err.println();
		System.err.println("ERROR!");
		System.err.println("Not enough partitions for max needed input size of " + maxInputNeeded + " bytes.");
		System.err.println("Input partition size is " + inputPartitionSize + " bytes.");
		System.err.println("Number of partitions is " + inputPartitionCount + ".");
		System.err.println("Total actual input data size is " + (((long) inputPartitionSize) * ((long) inputPartitionCount)) + " bytes < " + maxInputNeeded + " bytes.");
		System.err.println("Need to generate a larger input data set.");
		System.err.println();

		throw new Exception("Input data set not large enough. Need to generate a larger data set.");
	    } else {

		System.err.println();
		System.err.println("Max needed input size " + maxInputNeeded + " bytes.");
		System.err.println("Actual input size is " + (((long) inputPartitionSize) * ((long) inputPartitionCount)) + " bytes >= " + maxInputNeeded + " bytes.");
                System.err.println("All is good.");
		System.err.println();
	    }

	    // print shell scripts

	    printOutput(workloadData, clusterSizeRaw, clusterSizeWorkload, 
			inputPartitionSize, inputPartitionCount, scriptDirPath, hdfsInputDir, hdfsOutputPrefix,
			totalDataPerReduce, workloadOutputDir, hadoopCommand, pathToWorkGenJar, pathToWorkGenConf);



	}

	
    }
}

