## -*- docker-image-name: "mauler/simple-ftp-server" -*-

FROM python:slim
MAINTAINER Paulo <proberto.macedo@gmail.com>

ENV FTP_ROOT /ftp-home
ENV FTP_USER ftp
ENV FTP_PASS ftp
ENV FTP_PORT 21
ENV TLS_CERTFILE ""
ENV TLS_KEYFILE ""
ENV FTP_ADDRESS ""
ENV FTP_PORTRANGE_LOW ""
ENV FTP_PORTRANGE_HIGH ""

VOLUME /ftp-home

ADD bin/* /bin/

RUN pip install pyopenssl pyftpdlib && \
    mkdir -pv $FTP_ROOT

EXPOSE $FTP_PORT

ENTRYPOINT /bin/simple-ftp-server
