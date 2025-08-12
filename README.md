# Inception
'Inception' project from 42 whose goal was to create a Docker infrastructure inside a Virtual Machine, using three services each in its own container: NGINX, MariaDB and WordPress. Using pre-build images was forbidden.

## Install
Don't forget to have a .env file located at the srcs folder with the following defined variables: *DOMAINE_NAME*, *SQL_HOST*, *SQL_DATABASE*, *SQL_USER*, *SQL_PASSWORD*, *SQL_ROOT_PASSWORD*, *WP_USER*, *WP_USER_EMAIL*, *WP_USER_PASSWORD*, *WP_ADMIN_USER*, *WP_ADMIN_EMAIL*, *WP_ADMIN_PASSWORD*.

To build, run the command in the inception folder : 
```
make build
```
Then you can access the wordpress website using the following address: oloncle.42.fr.
