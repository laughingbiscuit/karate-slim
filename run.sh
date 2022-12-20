#!/bin/sh
set -e

docker build -t karate-slim .
docker run -d --name karate --rm -p 5900:5900 --cap-add=SYS_ADMIN -v $(pwd)/results:/karate/target karate-slim
sleep 2
docker exec -i karate mvn test
docker stop karate
