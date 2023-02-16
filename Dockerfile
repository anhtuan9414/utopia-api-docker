FROM ubuntu:18.04
WORKDIR /app

COPY install.sh /app/install.sh
RUN bash install.sh

EXPOSE 22825
