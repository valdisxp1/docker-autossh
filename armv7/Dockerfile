FROM schmich/armv7hf-alpine-qemu:latest
MAINTAINER Valdis Adamsons <valdisxp1@gmail.com>

RUN ["cross-build-start"]

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache openssh autossh

RUN >/etc/motd

RUN ["cross-build-end"]

COPY tunnel.sh keygen.sh test.sh entry.sh /
COPY ssh_config /etc/ssh/

CMD [ "/entry.sh" ]


