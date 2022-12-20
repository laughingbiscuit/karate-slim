FROM ptrthomas/karate-chrome

ADD ./helpers/bootstrap /karate
WORKDIR /karate

ADD features /karate/src/test/java/features
ADD ./helpers/FeaturesTest.java /karate/src/test/java/features/FeaturesTest.java


