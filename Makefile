PROJECT_NAME=jersey

start:
	@docker stop resurface || true
	@docker build -t test-jersey --no-cache .
	@docker-compose up --detach

stop:
	@docker-compose stop
	@docker-compose down --volumes --remove-orphans
	@docker image rmi -f test-jersey

bash:
	@docker exec -it jersey bash

logs:
	@docker logs -f jersey

ping:
	@curl "http://localhost/helloworld" -H 'Content-Type: text/plain' --data-binary 'Hello World'

restart:
	@docker-compose stop
	@docker-compose up --detach

test:
	@docker exec -it jersey python3 test.py