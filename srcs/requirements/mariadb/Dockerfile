FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/init.sh /tools/init.sh

RUN chmod +x /tools/init.sh

EXPOSE 3306

ENTRYPOINT ["/tools/init.sh"]
