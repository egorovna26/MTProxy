FROM ubuntu:22.04

WORKDIR /opt/mtproxy

EXPOSE 2398 443

COPY run.sh /opt/mtproxy

RUN chmod +x /opt/mtproxy/run.sh

COPY objs/bin/mtproto-proxy /opt/mtproxy

RUN chmod +x /opt/mtproxy/mtproto-proxy

RUN apt-get update && apt-get install -y curl iproute2

ENTRYPOINT ["/opt/mtproxy/run.sh"]
