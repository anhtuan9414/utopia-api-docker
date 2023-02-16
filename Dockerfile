FROM ubuntu:18.04
WORKDIR /app

COPY install.sh /app/install.sh
RUN bash install.sh

COPY setup_account.sh /app/setup_account.sh
RUN setup_account.sh

EXPOSE 22825
