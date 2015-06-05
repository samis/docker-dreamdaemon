FROM ubuntu:latest
MAINTAINER CompanionCube samuel.hodgkins@sky.com
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get -y install libc6-i386 wget unzip make libstdc++6:i386
RUN wget http://www.byond.com/download/build/507/507.1286_byond_linux.zip && unzip 507.1286_byond_linux.zip && rm 507.1286_byond_linux.zip
WORKDIR /byond
RUN mkdir -p /usr/share/man/man6/ && make install
WORKDIR /
RUN rm -r byond
CMD DreamDaemon
