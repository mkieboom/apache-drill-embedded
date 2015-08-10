# Apache Drill v1.1.0 - embedded mode
#
# VERSION 0.1 - not for production, use at own risk
# General instructions: https://drill.apache.org/docs/install-drill-introduction/
# 


#
# Using CentOS as the base image
#
FROM centos

MAINTAINER mkieboom @mapr.com

#
# Prerequisite: Install Java, tar and create Drill folders
# https://drill.apache.org/docs/embedded-mode-prerequisites/
#
RUN yum install -y tar java-1.7.0-openjdk-devel && \
    mkdir -p /drill-scripts && \
    mkdir -p /opt/drill
#
# Download and Install Apache Drill
# https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/
#
RUN curl -o apache-drill-1.1.0.tar.gz http://getdrill.org/drill/download/apache-drill-1.1.0.tar.gz && \
    tar zxpf apache-drill-1.1.0.tar.gz -C /opt/drill

#
# Start Apache Drill in embedded mode
# https://drill.apache.org/docs/starting-drill-on-linux-and-mac-os-x/
#
ADD bootstrap.sh /drill-scripts/bootstrap.sh
RUN chown root:root /drill-scripts/bootstrap.sh && \
    chmod 700 /drill-scripts/bootstrap.sh
ENV BOOTSTRAP /drill-scripts/bootstrap.sh

#
# Expose the Apache Drill Web UI 
# https://drill.apache.org/docs/storage-plugin-registration/
#
EXPOSE 8047
