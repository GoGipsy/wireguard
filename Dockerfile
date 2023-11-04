FROM alpine:3.18

ADD wireguard_healthcheck.py entrypoint.sh . 

RUN apk update && \
  apk add -U wireguard-tools && \
  apk add python3 curl  && \
  chmod +x entrypoint.sh wireguard_healthcheck.py

VOLUME [ "/etc/wireguard" ]

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 51820/UDP 8080/TCP

