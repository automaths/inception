if [ ! -d /var/lib/mysql/nsartral_42 ]; then
    mysqld & sleep 10
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_WORDPRESS};"
    mysql -u root -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON ${MARIADB_WORDPRESS}.* TO '${MARIADB_USER}'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MARIADB_ROOT_PASSWORD}');"
    service mysql restart
    killall -KILL mysqld
    sleep 5
    touch /var/lib/mysql/nsartral_42
fi
mysqld

