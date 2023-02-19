FROM ubuntu:18.04
WORKDIR /app

COPY install.sh /app/install.sh
RUN bash install.sh

COPY utopia.cfg /app/utopia.cfg
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 22825
EXPOSE 25000
CMD ["/app/start.sh"]
