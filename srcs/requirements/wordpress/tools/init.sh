#!/bin/bash

until mysqladmin ping -h"$SQL_HOST" --silent; do
	echo "Waiting for $SQL_HOST..."
	sleep 2
done

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
cd /var/www/wordpress

sed -i "s/database_name_here/${SQL_DATABASE}/" wp-config.php
sed -i "s/username_here/${SQL_USER}/" wp-config.php
sed -i "s/password_here/${SQL_PASSWORD}/" wp-config.php
sed -i "s/localhost/${SQL_HOST}/" wp-config.php

if ! wp core is-installed --path=/var/www/wordpress --allow-root; then
	wp core install \
		--path=/var/www/wordpress \
		--url="https://${DOMAIN_NAME}" \
		--title="Inception website" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--allow-root
fi

if ! wp user get $WP_USER --path=/var/www/wordpress --allow-root > /dev/null 2>&1; then
	wp user create $WP_USER $WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD \
		--role=author \
		--path=/var/www/wordpress \
		--allow-root
fi

mkdir -p /run/php

exec php-fpm7.4 -F