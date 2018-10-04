docker-build:
	docker build -t lua-dev .

docker-sh:
	docker run -it --rm lua-dev:latest  /bin/bash
