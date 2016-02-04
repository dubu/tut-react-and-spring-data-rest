#!/bin/bash

USER=56b035a109d8699b44000dc6
SERVER=c-mandu.cloudsc.kr
WEB_HOME=/var/lib/openshift/56b035a109d8699b44000dc6/jbossews/webapps
#WEB_HOME=/var/lib/openshift/56b035a109d8699b44000dc6/app-root/repo/webapps

git pull
mvn clean package -Dmaven.test.skip=true

SSH="ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_open"

scp -i ~/.ssh/id_open target/react-and-spring-data-rest-security-0.0.1-SNAPSHOT.war $USER@$SERVER:$WEB_HOME/ROOT.war

ssh -i ~/.ssh/id_open $USER@$SERVER gear stop
ssh -i ~/.ssh/id_open $USER@$SERVER gear start
