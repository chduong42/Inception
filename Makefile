# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chduong <chduong@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/28 19:17:46 by chduong           #+#    #+#              #
#    Updated: 2022/10/22 04:11:43 by chduong          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

VOLUME	=	/home/chduong/data
DOCKER	=	docker compose

all	: build up

build :
	mkdir -p $(VOLUME)/wordpress
	mkdir -p $(VOLUME)/mariadb
	$(DOCKER) -f srcs/docker-compose.yml build

up :
	$(DOCKER) -f srcs/docker-compose.yml up -d

stop	:
	$(DOCKER) -f srcs/docker-compose.yml stop

down	:
	$(DOCKER) -f srcs/docker-compose.yml down

logs	:
	$(DOCKER) -f srcs/docker-compose.yml logs

clean:
	# docker volume ls -qf dangling=true | xargs -r docker volume rm
	docker system prune -f -a

fclean: stop clean
	rm -rf ${VOLUME}

re : fclean all

.PHONY: all re down clean