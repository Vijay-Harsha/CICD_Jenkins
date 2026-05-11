FROM registry.access.redhat.com/ubi10/ubi:latest

LABEL maintainer="Vijay"

# Install Java and required tools
RUN dnf install -y \
    java-21-openjdk \
    wget \
    tar \
    gzip && \
    dnf clean all

# Tomcat version
ENV TOMCAT_VERSION=10.1.39

# Download and install Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Environment variables
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$PATH:$CATALINA_HOME/bin

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
