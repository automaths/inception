FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

RUN openssl req -x509 -nodes \
	-subj "/C=FR/ST=Paris/L=42/O=42/OU=42/CN=nsartral.42.fr" \
	-keyout /etc/ssl/nsartral.42.fr.key -out /etc/ssl/nsartral.42.fr.crt 

COPY ./conf/inception.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

CMD [ "nginx", "-g", "daemon off;" ]