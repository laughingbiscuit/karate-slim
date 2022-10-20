#!/bin/sh
set -e

docker build -t blah .
docker run --net=host -v $(pwd)/results:/root/myproject/target/karate-reports/  -v /var/run/docker.sock:/var/run/docker.sock -it blah 
