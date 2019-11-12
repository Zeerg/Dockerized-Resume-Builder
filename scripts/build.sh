#!/bin/bash

# This script builds the docker image

APP_NAME=$1

docker build -t "$APP_NAME" .
