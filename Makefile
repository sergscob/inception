all:
	mkdir -p /home/sskobyak/data/wp
	mkdir -p /home/sskobyak/data/db
	docker compose -f ./docker-compose.yml up -d --build

down:
	docker compose -f ./docker-compose.yml down

re:
	docker compose -f ./docker-compose.yml down --remove-orphans -v --rmi all
	mkdir -p /home/sskobyak/data/wp
	mkdir -p /home/sskobyak/data/db
	docker compose -f ./docker-compose.yml up -d --build --force-recreate

clean:
	docker compose -f ./docker-compose.yml down --remove-orphans -v --rmi all
	sudo rm -rf /home/sskobyak/data/wp
	sudo rm -rf /home/sskobyak/data/db

clean-all:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	sudo rm -rf /home/sskobyak/data/*

.PHONY: all re down clean-all clean