FROM ptrthomas/karate-chrome

WORKDIR /root
RUN mvn archetype:generate \
  -DarchetypeGroupId=com.intuit.karate \
  -DarchetypeArtifactId=karate-archetype \
  -DarchetypeVersion=1.2.0 \
  -DgroupId=com.mycompany \
  -DartifactId=myproject
RUN rm -rf /root/myproject/src/test/java/examples
ADD features /root/myproject/src/test/java/features
ADD ./helpers/.FeaturesTest.java /root/myproject/src/test/java/features

WORKDIR /root/myproject

CMD ["mvn", "test"]
