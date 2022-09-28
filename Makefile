# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chduong <chduong@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/28 19:17:46 by chduong           #+#    #+#              #
#    Updated: 2022/09/28 19:27:18 by chduong          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@docker-compose -f ./scrs/docker-compose.yml up -d --build

stop:
	@docker-compose -f srcs/docker-compose.yml stop

down:
	@docker-compose -f ./scrs/docker-compose.yml down

re:
	@docker-compose -f scrs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

fclean: stop clean
	sudo rm -rf ${HOME}data

.PHONY: all re down clean