# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "Rajesh Surampalli" 
COPY target/*.war /usr/local/tomcat/webapps
