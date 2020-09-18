# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "Rajesh Surampalli" 
COPY webapp/target/*.war /usr/local/tomcat/webapps
