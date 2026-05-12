FROM eclipse-temurin:21-jre-alpine

LABEL maintainer="Vijay"

# Tomcat version
ENV TOMCAT_VERSION=10.1.39

# Install wget and download Tomcat
RUN apk add --no-cache wget tar && \
    wget https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Remove default apps to reduce size
RUN rm -rf /opt/tomcat/webapps/*

# Environment variables
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$PATH:$CATALINA_HOME/bin

# Expose Tomcat port
EXPOSE 8080
# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
