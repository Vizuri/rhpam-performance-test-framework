# Follow these steps to create an OCP cluster in AWS and the a database for PAM #
## Create VPC and database ##
Edit the vpc-infra-parmas.json to customize the parameters for your VPC and database.
Run the following command to create the VPC and Database
`aws cloudformation create-stack --stack-name ocp-vpc-infra --template-body file://vpc-infra.yaml --parameters file://vpc-infra-params.json`
## Create OCP cluster ##
Download an make sure OpenShift installer probram openshift-install.
Create a directory to host the OpenShift configuration files.
Copy the install-config.yaml.sample file into the folder and rename it install-config.yaml
Modify the install-config-yaml file.  Set the pull secret and vpc subnet created above.
Run the following command to create your cluster.
`openshift-install create cluster --dir ocppam`
