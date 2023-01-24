all: 
	sudo mkdir -p /home/nsartral/data/wordpress_volume/
	sudo mkdir -p /home/nsartral/data/mariadb_volume/
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: stop
	docker system prune -a; 

fclean: stop clean
	sudo rm -rf /home/nsartral/data
	docker volume rm srcs_mariadb_volume srcs_wordpress_volume 

re: fclean all

.PHONY: up down clean fclean re all
