# Jetty & Cargo
# 
# WEBSITE https://github.com/mthenw/docker-jetty-cargo 
# VERSION 0.1.0

FROM base
MAINTAINER Maciej Winnicki "maciej.winnicki@gmail.com"

RUN apt-get update

# Install Java
RUN apt-get install -y openjdk-7-jre-headless
RUN mkdir /usr/java
RUN ln -s /usr/lib/jvm/java-7-openjdk-amd64 /usr/java/default

# Install Jetty
ADD http://eclipse.org/downloads/download.php?file=/jetty/stable-9/dist/jetty-distribution-9.0.5.v20130815.tar.gz&r=1 /opt/jetty.tar.gz
RUN tar -xvf /opt/jetty.tar.gz -C /opt/
RUN mv /opt/jetty-distribution-9.0.5.v20130815 /opt/jetty
RUN rm /opt/jetty.tar.gz
RUN useradd jetty -U -s /bin/false
RUN chown -R jetty:jetty /opt/jetty
RUN rm -R /opt/jetty/webapps.demo

# Install Cargo
ADD http://repo1.maven.org/maven2/org/codehaus/cargo/cargo-jetty-7-and-onwards-deployer/1.4.4/cargo-jetty-7-and-onwards-deployer-1.4.4.war /opt/jetty/webapps/cargo-jetty-7-and-onwards-deployer-1.4.4.war

# Run Jetty
EXPOSE 8080
CMD ["java", "-Djetty.home=/opt/jetty", "-jar", "/opt/jetty/start.jar"]
