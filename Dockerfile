# Use Red Hat Universal Base Image 10
FROM registry.access.redhat.com/ubi10/ubi:latest

# Maintainer
LABEL maintainer="Vijay"

# Install Java, wget and tar
RUN dnf install -y java-17-openjdk wget tar gzip && \
    dnf clean all

# Set Tomcat version
ENV TOMCAT_VERSION=10.1.41

# Download and extract Tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Set environment variables
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$PATH:$CATALINA_HOME/bin

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
