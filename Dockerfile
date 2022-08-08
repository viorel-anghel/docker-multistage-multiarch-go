FROM golang:1.18-buster AS builder
  
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY *.go .
ENV GOARCH=$ARCH
RUN go build -o app-run

# final image
FROM ubuntu:22.04

RUN apt-get update -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y telnet iputils-ping net-tools netbase \
  netcat-openbsd rsync tcpdump procps grep coreutils diffutils \
  bind9-host wget curl socat vim-nox less
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-client
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install redis-tools

COPY --from=builder /app/app-run /

EXPOSE 8080
  
RUN adduser --disabled-password --gecos '' user
WORKDIR /home/user
USER user

ENTRYPOINT [ "sleep 1h" ]

