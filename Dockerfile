FROM alpine:latest

RUN apk update
RUN apk add openjdk12-jdk maven docker
WORKDIR /root
RUN mvn archetype:generate \
  -DarchetypeGroupId=com.intuit.karate \
  -DarchetypeArtifactId=karate-archetype \
  -DarchetypeVersion=1.2.0 \
  -DgroupId=com.mycompany \
  -DartifactId=myproject
RUN rm -rf /root/myproject/src/test/java/examples
ADD features /root/myproject/src/test/java/features
RUN cat > /root/myproject/src/test/java/features/Features.java << EOF
package features;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
class FeaturessTest {
@Test
  void testParallel() {
    Results results = Runner.path("classpath:examples")
    .outputCucumberJson(true).parallel(5);
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
  }
}
EOF

WORKDIR /root/myproject

CMD ["mvn", "test"]
