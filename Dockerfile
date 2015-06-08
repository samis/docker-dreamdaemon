FROM ubuntu:latest
MAINTAINER CompanionCube samuel.hodgkins@sky.com
ENV BYOND_MAJOR 507
ENV BYOND_MINOR 1286
ENV BYOND_VERSION ${BYOND_MAJOR}.${BYOND_MINOR}
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get -y install libc6-i386 wget unzip make libstdc++6:i386
RUN wget http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_VERSION}_byond_linux.zip && unzip ${BYOND_VERSION}_byond_linux.zip && rm ${BYOND_VERSION}_byond_linux.zip
WORKDIR /byond
RUN mkdir -p /usr/share/man/man6/ && make install
WORKDIR /
RUN rm -r byond
COPY DreamDaemon.sh /
RUN chmod +x /DreamDaemon.sh
ENTRYPOINT ["/DreamDaemon.sh", "3000"]
EXPOSE 3000
CMD ["/game/world.dmb", "-safe"]