slave_array=(10.128.2.12 10.128.2.13 10.128.2.14 10.129.2.10 10.129.2.11 10.130.2.36 10.130.2.37 10.131.0.102 10.131.0.103 10.131.0.104); index=10 && while [ ${index} -gt 0 ]; do for slave in ${slave_array[@]}; do if echo 'test open port' 2>/dev/null > /dev/tcp/${slave}/1099; then echo ${slave}' ready' && slave_array=(${slave_array[@]/${slave}/}); index=$((index-1)); else echo ${slave}' not ready'; fi; done; echo 'Waiting for slave readiness'; sleep 2; done
echo "Installing needed plugins for master"
rm -fr /report/*
cd /opt/jmeter/apache-jmeter/bin
sh PluginsManagerCMD.sh install-for-jmx pam-perf.jmx
jmeter -Ghost=demo-kie-app-kieserver.pam -Gport=8080 -Gprotocol=http -Gthreads=10 -Gduration=60 -Grampup=6 --reportatendofloadtests --reportoutputfolder /report/report-pam-perf.jmx-2021-10-12_135642 --logfile /report/pam-perf.jmx_2021-10-12_135642.csv --nongui --testfile pam-perf.jmx -Dserver.rmi.ssl.disable=true --remoteexit --remotestart 10.128.2.12,10.128.2.13,10.128.2.14,10.129.2.10,10.129.2.11,10.130.2.36,10.130.2.37,10.131.0.102,10.131.0.103,10.131.0.104 >> jmeter-master.out 2>> jmeter-master.err &
java -jar /opt/jmeter/apache-jmeter/lib/jolokia-java-agent.jar start JMeter >> jmeter-master.out 2>> jmeter-master.err
wait
