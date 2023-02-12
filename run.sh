#!/bin/sh
set -e

# preprocess - humanify all

(cd features && for FILE in *.hfeature; do
  sh ../helpers/humanify.sh > $(echo $FILE | sed 's/hfeature/feature/')
done)

# run tests
docker build -t karate-slim .
docker run -d --name karate --rm -p 5900:5900 --cap-add=SYS_ADMIN -v $(pwd)/results:/karate/target karate-slim
sleep 2
docker exec -i karate mvn test
docker stop karate
