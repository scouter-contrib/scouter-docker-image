FROM openjdk:8-jdk-alpine
## url setting
LABEL maintainer="yosong.heo@gmail.com"
ARG INSTALL_URL=https://github.com/scouter-project/scouter/releases/download/v${SCOUTER_VERSION:-2.7.0}/scouter-all-${SCOUTER_VERSION:-2.7.0}.tar.gz
## install
WORKDIR /home
RUN apk add -U tzdata wget unzip;cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime; wget ${INSTALL_URL};tar xvf scouter-all-${SCOUTER_VERSION:-2.7.0}.tar.gz;mv scouter/server ./scouter-server;cp scouter/webapp/scouter-webapp-${SCOUTER_VERSION:-2.7.0}.jar ./scouter-server/lib;cp scouter/webapp/lib/*.jar ./scouter-server/lib; rm -rf scouter-all-${SCOUTER_VERSION:-2.7.0}.tar.gz scouter

COPY startup.sh scouter-server/startup.sh
COPY scouter.conf scouter-server/conf/scouter.conf

RUN ls -lat scouter-server;chmod 755 -R scouter-server

EXPOSE 6180/tcp
EXPOSE 6188/tcp
EXPOSE 6100/tcp
EXPOSE 6100/udp

WORKDIR /home/scouter-server

ENTRYPOINT ["/home/scouter-server/startup.sh"]

