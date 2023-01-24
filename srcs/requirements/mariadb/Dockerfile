FROM debian:buster

RUN apt-get update
RUN apt-get -y install mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /run/mysqld
    
RUN chown -R mysql:root /run/mysqld
RUN chown -R mysql:root /var/run/mysqld

COPY ./conf/setup.sh .
COPY ./conf/inception.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

CMD ["bash", "./setup.sh"]