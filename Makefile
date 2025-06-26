.PHONY: kill build down clean restart

COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
ENV_FILE = ./srcs/.env 

build:
	mkdir -p /home/oloncle/data/wordpress
	mkdir -p /home/oloncle/data/mariadb
	$(COMPOSE) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up --build -d

kill:
	$(COMPOSE) -f $(COMPOSE_FILE) kill

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

clean:
	$(COMPOSE) -f $(COMPOSE_FILE) down -v

fclean: clean
	sudo rm -rf /home/oloncle/data/wordpress
	sudo rm -rf /home/oloncle/data/mariadb
	docker system prune -af

restart: clean build

frestart: fclean build
