# docker-jetty-cargo

Dockerfile for setting up [Docker](https://github.com/dotcloud/docker) container with [Jetty](http://www.eclipse.org/jetty/) and [Cargo](http://cargo.codehaus.org/) installed.

Versions:

* Jetty 9.0.5
* Cargo 1.4.4

## Pulling

    # docker pull mthenw/jetty-cargo

## Running

    # docker run -d mthenw/jetty-cargo
    092b9a6e0b7c
    # docker ps
    ID            IMAGE                      COMMAND               CREATED        STATUS        PORTS
    092b9a6e0b7c  mthenw/jetty-cargo:latest  java -Djetty.home=/o  3 seconds ago  Up 3 seconds  49175->8080  

## Deploy Java application

While container is running Java application can be deployed using Cargo plugin for [Maven](http://cargo.codehaus.org/Maven2+plugin) or [Gradle](https://github.com/bmuschko/gradle-cargo-plugin). Port on which docker exposes Jetty is on ```docker ps``` output.


## Building

From sources:

    # docker build github.com/mthenw/docker-jetty-cargo
