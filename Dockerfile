FROM ubuntu:18.04
WORKDIR /app

COPY install.sh /app/install.sh
RUN bash install.sh

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 22825
CMD ["/app/start.sh"]
