# Follow these steps to deploy kie server for test case #
## Deploy PAM Operator ##
- Create project for PAM deployment. `oc new-project pam`
- Create ObjectGroup for PAM Operator `oc apply -f pam-og.yaml`
- Deploy PAM Operator `oc apply -f pam-sub.yaml`
## Deploy kieapp for test scenario ##
Once your PAM Operator has been deployed you can deploy a kie container to test.
Choose the configuation you would like to test and run the following command to deploy the kieapp.
`oc apply -f <RESOURCE-FILE>`
Where resource is one of the kie-server resource definction file.
For Example: `oc apply -f kie-server-min.yaml`
