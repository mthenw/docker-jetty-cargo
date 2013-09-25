# docker-jetty-cargo

Dockerfile for setting up [Docker](https://github.com/dotcloud/docker) container with [Jetty](http://www.eclipse.org/jetty/) and [Cargo](http://cargo.codehaus.org/) installed.

Versions:

* Jetty 9.0.5
* Cargo 1.4.4

## Running

    # docker run -d mthenw/jetty
    092b9a6e0b7c
    # docker ps
    ID            IMAGE                COMMAND               CREATED        STATUS        PORTS
    092b9a6e0b7c  mthenw/jetty:latest  java -Djetty.home=/o  3 seconds ago  Up 3 seconds  49175->8080  

## Building

From sources:

    # docker build github.com/mthenw/docker-jetty-cargo
    
Image is available in docker index:

    # docker pull mthenw/docker-jetty-cargo
