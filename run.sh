#!/bin/sh
set -e

docker build -t karate-chrome .
docker run --name karate --rm --cap-add=SYS_ADMIN -v "$PWD":/karate -v "$HOME"/.m2:/root/.m2 karate-chrome &
sleep 5
docker exec karate mvn test -B -ntp
docker stop karate
wait
