# Java, Jetty and Cargo
# 
# WEBSITE https://github.com/mthenw/docker-jetty-cargo 
# VERSION 0.3.0

FROM ubuntu:quantal
MAINTAINER Maciej Winnicki "maciej.winnicki@gmail.com"

# Install Java
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Install Jetty
ADD http://eclipse.org/downloads/download.php?file=/jetty/9.1.0.v20131115/dist/jetty-distribution-9.1.0.v20131115.tar.gz&r=1 /opt/jetty.tar.gz
RUN tar -xvf /opt/jetty.tar.gz -C /opt/
RUN rm /opt/jetty.tar.gz
RUN mv /opt/jetty-distribution-9.1.0.v20131115 /opt/jetty
RUN useradd jetty -U -s /bin/false
RUN chown -R jetty:jetty /opt/jetty

# Install Cargo
ADD http://repo1.maven.org/maven2/org/codehaus/cargo/cargo-jetty-7-and-onwards-deployer/1.4.4/cargo-jetty-7-and-onwards-deployer-1.4.4.war /opt/jetty/webapps/cargo-jetty-7-and-onwards-deployer-1.4.4.war

# Run Jetty
EXPOSE 8080
CMD ["java", "-Djetty.home=/opt/jetty", "-jar", "/opt/jetty/start.jar"]
