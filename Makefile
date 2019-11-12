SHELL := /usr/bin/env bash

APP_NAME := resume-generator

.PHONY: all

VOLUMES := -v ${PWD}/themes:/app/themes -v ${PWD}/.env:/app/.env -v ${PWD}/resume:/resume -v ${PWD}/output:/output

all: publish

pdf:
	docker run $(VOLUMES) "$(APP_NAME)" pdf

html:
	docker run $(VOLUMES) "$(APP_NAME)" html

build:
	scripts/build.sh $(APP_NAME)

run:
	docker run -it $(VOLUMES) "$(APP_NAME)" bash

scrub:
	scripts/scrub.sh
	
publish: scrub html

	cp -R output/build/* docs/
