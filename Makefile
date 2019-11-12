SHELL := /usr/bin/env bash

APP_NAME := resume-generator

.PHONY: all

VOLUMES := -v ${PWD}/themes:/app/themes -v ${PWD}/.env:/app/.env -v ${PWD}/resume:/resume -v ${PWD}/output:/output

all: html

pdf:
	docker run $(VOLUMES) "$(APP_NAME)" pdf
	scripts/scrub.sh

html:
	docker run $(VOLUMES) "$(APP_NAME)" html
	scripts/scrub.sh

build:
	scripts/build.sh $(APP_NAME)

run:
	docker run -it $(VOLUMES) "$(APP_NAME)" bash

publish:
	cp -R output/build/* docs/
