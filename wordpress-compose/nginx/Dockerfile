FROM alpine:3.16

LABEL   version="1.0"\
        maintainer="Kenny DUONG <chduong@student.42.fr>"\
        description="NGINX"

# EXPOSE	443

RUN apk -U upgrade && apk add --no-cache nginx openssl curl vim

# generate self-signed ssl key-certificate pair

# RUN openssl req -x509 -newkey rsa:4096 \
# 	-keyout /etc/ssl/certs/inception.key \
# 	-out /etc/ssl/certs/inception.crt \
# 	-sha256 -days 365 -nodes \
#         -subj "/C=FR/ST=France/L=Paris/O=Me/OU=42Paris/CN=localhost/emailAddress=chduong@student.42.fr"

COPY ./config/nginx.conf /etc/nginx/conf.d

ENTRYPOINT ["nginx", "-g", "daemon off;"]