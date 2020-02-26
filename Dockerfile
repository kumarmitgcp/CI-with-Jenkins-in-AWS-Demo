FROM tomcat:8.0.20-jre8

RUN mkdir /usr/local/tomcat/webapps/myapp

ADD var/lib/jenkins/workspace/BuildProject/project/target/project-1.0-SANDEEP.war /usr/local/tomcat/webapps/project-1.0-SANDEEP.war
