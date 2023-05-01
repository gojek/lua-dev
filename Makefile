docker-multibuild:
	# docker-buildx create --name multibuilder --driver docker-container --bootstrap
	docker-buildx use multibuilder
	docker-buildx build --platform=linux/amd64,linux/arm64 -t lua-dev .
	docker-buildx build --load -t lua-dev .

docker-build-arm64:
	docker-buildx build --platform=linux/arm64 --load -t lua-dev .

docker-sh:
	docker run -it --rm lua-dev:latest  /bin/bash
