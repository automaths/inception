FROM debian:buster

RUN apt-get update
RUN mkdir -p /var/www/html
RUN mkdir -p /run/php/
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-curl php7.3-mysql php7.3-gd curl mariadb-client

COPY ./conf/inception.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN ln -sf /dev/stdout /var/log/php7.3-fpm.access.log && ln -sf /dev/stderr /var/log/php7.3-fpm.log

WORKDIR /var/www/html
COPY ./conf/setup.sh .

CMD ["bash", "setup.sh"]