#!/bin/sh
set -e

docker run --name karate --rm -p 5900:5900 --cap-add=SYS_ADMIN -v "$PWD":/src ptrthomas/karate-chrome
sleep 5
docker exec -it -w /src karate mvn clean test -DargLine='-Dkarate.env=docker' 
docker stop karate
