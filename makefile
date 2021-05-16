MYSQL_PORT=3306
MYSQL_DBNAME=desafio_docker
MYSQL_USER=root
MYSQL_URL=localhost
MYSQL_CONTAINER_NAME=mysql-desafio
API_CONTAINER_NAME=gocontainer
API_IMAGE=roodrigolr/desafio-docker1-pfa
API_PORT=3000
NGINX_CONTAINER_NAME=nginx-desafio
NGINX_IMAGE=roodrigolr/nginx-desafio
NETWORK=network-desafio

create-network:
	docker network create $(NETWORK)

mysql:
	docker run --rm --name $(MYSQL_CONTAINER_NAME) --network $(NETWORK) -p $(MYSQL_PORT):3306 -e MYSQL_PASSWORD="" -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:8.0

init-db:
	docker exec $(MYSQL_CONTAINER_NAME) mysql -u root -e "create schema $(MYSQL_DBNAME);"
	docker run -v ${PWD}/migrations:/migrations --network $(NETWORK) migrate/migrate -path=/migrations/ -database "mysql://root@tcp($(MYSQL_CONTAINER_NAME))/$(MYSQL_DBNAME)" up

init-stack:
	docker run --rm --name $(API_CONTAINER_NAME) --network $(NETWORK) -e MYSQL_URL=$(MYSQL_CONTAINER_NAME) -e MYSQL_DBNAME=$(MYSQL_DBNAME) -e API_PORT=$(API_PORT) -e MYSQL_USER=$(MYSQL_USER) -d $(API_IMAGE)
	docker build -t $(NGINX_IMAGE) ./nginx
	docker run --rm --name $(NGINX_CONTAINER_NAME) --network $(NETWORK) -p 8080:80 -d $(NGINX_IMAGE)

delete-stack:
	docker stop $(NGINX_CONTAINER_NAME)
	docker stop $(API_CONTAINER_NAME)
	docker stop $(MYSQL_CONTAINER_NAME)
	docker network rm $(NETWORK)

