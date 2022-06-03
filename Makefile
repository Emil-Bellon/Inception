NAME		= inception

COMPOSE		= docker-compose -f srcs/docker-compose.yml -p $(NAME)

all:		up

re:			fclean all


up:			build
			$(COMPOSE) up --detach

down:
			$(COMPOSE) down

build:		volumes
			$(COMPOSE) build --parallel

create:		build
			$(COMPOSE) create

ps:
			$(COMPOSE) ps --all

start:
			$(COMPOSE) start

restart:
			$(COMPOSE) restart
stop:
			$(COMPOSE) stop

clean:
			docker-compose --project-directory=srcs down --rmi all

fclean:
			docker-compose --project-directory=srcs down --rmi all --volumes
			sudo rm -rf /home/$(USER)/data/*

volumes:
			@mkdir -p /home/$(USER)/data/site
			@mkdir -p /home/$(USER)/data/db
								  
.PHONY:		all re up down build create ps start restart stop clean fclean