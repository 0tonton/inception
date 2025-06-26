FROM debian:bullseye

RUN apt-get update && apt-get install nginx -y \
&& mkdir -p /etc/nginx/ssl && apt-get install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=oloncle"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx_inception.conf /etc/nginx/conf.d/nginx_inception.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]