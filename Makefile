REPO := fooinha

NAME := nginx-modsecurity

TAG := latest

all: build

build:
	docker build --rm -t ${REPO}/${NAME}:${TAG} .
