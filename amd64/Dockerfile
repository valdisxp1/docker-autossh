FROM alpine:latest
MAINTAINER Valdis Adamsons <valdisxp1@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache openssh autossh

RUN >/etc/motd

COPY tunnel.sh keygen.sh keyscan.sh connect.sh entry.sh /

CMD [ "/entry.sh" ]


