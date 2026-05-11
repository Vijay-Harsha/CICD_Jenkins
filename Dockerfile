FROM redhat/ubi9:latest
RUN yum install java -y
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz /opt/tomcat
RUN tar xvfz apache-tomcat-9.0.91.tar.gz
RUN mv apache-tomcat-9.0.91 tomcat9
RUN mv tomcat9 /opt
EXPOSE 80
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

