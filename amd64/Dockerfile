FROM alpine:latest
MAINTAINER Valdis Adamsons <valdisxp1@gmail.com>

RUN apk add --no-cache openssh autossh

RUN >/etc/motd

COPY tunnel.sh keygen.sh test.sh entry.sh /
COPY ssh_config /etc/ssh/

CMD [ "/entry.sh" ]


