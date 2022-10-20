# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chduong <chduong@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/28 19:17:46 by chduong           #+#    #+#              #
#    Updated: 2022/10/10 18:02:21 by chduong          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME	=	/home/chduong/
DOCKER	=	docker compose

all		:
	mkdir -p $(HOME)data/wordpress
	mkdir -p $(HOME)data/mariadb
	$(DOCKER) -f srcs/docker-compose.yml build
	$(DOCKER) -f srcs/docker-compose.yml up -d

stop	:
	$(DOCKER) -f srcs/docker-compose.yml stop

down	:
	$(DOCKER) -f srcs/docker-compose.yml down

clean:
	docker volume ls -qf dangling=true | xargs -r docker volume rm
	docker system prune -f -a

fclean: stop clean
	sudo rm -rf ${HOME}data

re : fclean all

.PHONY: all re down clean