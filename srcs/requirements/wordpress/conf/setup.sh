if [ ! -f /var/www/html/nsartral_42 ]; then
	wp core download --allow-root
    sleep 10
    wp config create --allow-root --dbhost=${MARIADB_HOST} --dbname=${MARIADB_WORDPRESS} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASSWORD} --skip-check
	wp core install --url=${WORDPRESS_WEBSITE} --title="${WORDPRESS_TITLE}" --admin_user=${WORDPRESS_ROOT} --admin_password=${WORDPRESS_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL} --skip-email --allow-root
	wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=author --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root
	wp theme install "twentysixteen" --activate --allow-root
    touch /var/www/html/nsartral_42
fi
php-fpm7.3 --nodaemonize --allow-to-run-as-root