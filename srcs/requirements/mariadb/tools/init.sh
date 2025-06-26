#!/bin/bash

mysqld_safe &

until mysqladmin ping -h mariadb --silent; do
	echo "Waiting for MariaDB to start..."
	sleep 2
done

echo "Setting up MariaDB..."

mysql -u root --skip-password -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -u root --skip-password -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
exec mysqld_safe
echo "MariaDB ON..."
