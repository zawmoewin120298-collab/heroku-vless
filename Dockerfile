FROM alpine:latest

WORKDIR /etc/xray
COPY config.json /etc/xray/config.json
RUN apk add --no-cache curl
RUN curl -L -H "Cache-Control: no-cache" -o /usr/bin/xray https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /usr/bin/xray -d /usr/bin && \
    chmod +x /usr/bin/xray

CMD /usr/bin/xray -config /etc/xray/config.json

