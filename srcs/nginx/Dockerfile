FROM alpine:3.15.6

LABEL maintainer="Kenny DUONG <chduong@student.42.fr>"

RUN apk update && apk add --no-cache nginx openssl && \
        mkdir -p /var/log/nginx

# SSL generating cert
RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
                -out /etc/ssl/certs/chduong.crt \
                -keyout /etc/ssl/certs/chduong.key \
                -subj "/C=FR/ST=France/L=Paris/O=42/CN=chduong.42.fr"

COPY ./config/server.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]