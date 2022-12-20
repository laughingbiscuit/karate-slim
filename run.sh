#!/bin/sh
set -e

docker build -t blah .
docker run -d --name karate --rm -p 5900:5900 --cap-add=SYS_ADMIN -v $(pwd)/results:/karate/target/karate-reports blah
sleep 2
docker exec -i karate mvn test
docker stop karate
