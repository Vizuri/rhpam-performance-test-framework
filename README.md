# RedHat Process Automation Manager (PAM) Performance Framework #
This project contains the test framework to run a performance test against RedHat PAM.

The test framework utilizes Apache JMeter to execution API calles to the PAM API.

## Prerequisites ##
- OpenShift Container Platform - The test framework utilized OpenShift to deploy the test process instance KIE container and to run the JMeter test script.  Details on setting up an OpenShift enviroment for the test can be found [here](OCP-SETUP/README).
- PAM Operator - To deploy the test process instance kie server, you need the PAM Operator install in your OpenShift enviroment.  Details for how to depoy the PAM Operator can be found [here](PAM-SETUP).

If you already have the PAM Operator installed in an OpenShift environment proceed to Setup JMeter.

##Setup JMeter
To set JMeter in your OpenShift Environment, following these [instructions](JMETER/README).

##Deploy KIE Container
The kie folder contains several resource files to deploy kie containers for the performance test.  Choose one and edit for your needs.  You will have to update the database connectivity variables at a minimal.

Once updated, you can create a container using the following command.  Make sure you are in the OpenShift project where the PAM Operator is deployd.  Make sure the Operator is fully deployed before running.
`oc apply -f kie/kie-server-min.yaml`

##Run test scenario.
The scenario folder contains the pam-perf scenario test files.  The folder contains the following files:
-.env - Enviroment file that contains the settings for your enviroment.  Update for your specific enviroment.
-pam-perf.jmx - The JMeter test file for the test.

To run the performance test run the following command. `./start_test.sh -j pam-perf.jmx -n jmeter -i 10 -r`
--j - Provides provides the JMeter test file.
--n - Provides the namespace to run the test in.  This should be the namespace created when you setup JMeter.
--i - The number of JMeter slave pods to launch for the test.
--r - Produce report output.

Note that the number of test threads is the -i option time the threads parameter in the .env scenario directory.  So if you pass -i 10 and your threads is set to 10, you will be running 100 test threads.

This will generate a report folder with the results.  This will contain a .csv file with the raw results plus a directory containing HTML results and graphs.

##Run custom test scenario.
If you would like to run your own test against a different process instance you can do the following.
Create a new directory in the scenario folder.  Place you JMeter test file in this folder.  Note that the directory and the jmx file must be named the same thing.  Create a .env file with properties for your test using the one provided as a guide.  
Then you can run the test using the following command `./start_test.sh -j <CUSTOM_TEST>.jmx -n jmeter -i 10 -r`
- CUSTOM_TEST - Replace with you test scenario. 

-   


