FROM ubuntu:18.04
WORKDIR /app

COPY install.sh /app/install.sh
COPY setup_account.sh /app/setup_account.sh
RUN bash install.sh
ARG XDG_RUNTIME_DIR=/tmp/runtime-root
RUN bash setup_account.sh

EXPOSE 22825
