PROJECT_NAME=jersey

start:
	@docker stop resurface || true
	@docker build -t test-jersey --no-cache .
	@docker-compose up --detach

stop:
	@docker-compose stop
	@docker-compose down --volumes
	@docker image rmi -f test-jersey:latest

bash:
	@docker exec -it jersey bash

logs:
	@docker logs -f test_jersey_app

ping:
	@curl "http://localhost/helloworld"

restart:
	@docker-compose stop
	@docker-compose up
