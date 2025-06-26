FROM debian:bullseye


RUN apt-get update -y && apt-get upgrade -y && apt-get -y install wget \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    curl gnupg2

RUN apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    && apt-get clean

RUN mkdir -p /var/www/wordpress

RUN wget https://fr.wordpress.org/wordpress-6.8.1-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.8.1-fr_FR.tar.gz && rm wordpress-6.8.1-fr_FR.tar.gz

RUN chmod -R 755 /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/init.sh /tools/init.sh

RUN chmod +x /tools/init.sh

ENTRYPOINT ["/tools/init.sh"]
