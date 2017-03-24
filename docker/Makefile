REGISTRY = docker.internal.adroll.com:5000
VERSION = $(shell git rev-parse HEAD)
NAME = bi/$(shell basename $(shell pwd))

.PHONY: all deploy

all: build

build: Dockerfile
		docker build  -t $(REGISTRY)/$(NAME) .
		docker tag $(REGISTRY)/$(NAME) $(REGISTRY)/$(NAME):$(VERSION)

pull:
		docker pull $(REGISTRY)/$(NAME):latest

deploy:
		docker tag $(REGISTRY)/$(NAME) $(REGISTRY)/$(NAME):$(VERSION)
		docker push $(REGISTRY)/$(NAME)





