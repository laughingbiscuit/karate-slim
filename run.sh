#!/bin/sh
set -e

docker build -t blah .
docker run --privileged --net=host -v $(pwd)/results:/root/myproject/target/karate-reports/ -v /var/run/docker.sock:/var/run/docker.sock -i blah 
