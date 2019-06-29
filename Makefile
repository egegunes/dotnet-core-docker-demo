TAG=dotnet-core-docker-demo

build:
	docker build -t $(TAG) .
up:
	docker run --rm -p 8000:80 $(TAG)
