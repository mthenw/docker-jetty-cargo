# docker-jetty-cargo

Dockerfile for setting up [Docker](https://github.com/docker/docker) container with [Jetty](http://www.eclipse.org/jetty/) and [Cargo](http://cargo.codehaus.org/) installed.

Versions:

* Java 7 (Oracle)
* Jetty 9.0.7
* Cargo 1.4.4

## Pulling

    # docker pull mthenw/jetty-cargo

## Running

    # docker run -d -p 8080 mthenw/jetty-cargo
    092b9a6e0b7c
    # docker ps
    CONTAINER ID   IMAGE                      COMMAND                CREATED              STATUS              PORTS                    NAMES
    2bf1f924f2b4   mthenw/jetty-cargo:latest  java -Djetty.home=/o   About a minute ago   Up About a minute   0.0.0.0:49153->8080/tcp  lonely_tesla6

## Deploy Java application

While container is running Java application can be deployed using Cargo plugin for [Maven](http://cargo.codehaus.org/Maven2+plugin) or [Gradle](https://github.com/bmuschko/gradle-cargo-plugin). Port on which docker exposes Jetty is on ```docker ps``` output.

## Building

From sources:

    # docker build github.com/mthenw/docker-jetty-cargo
