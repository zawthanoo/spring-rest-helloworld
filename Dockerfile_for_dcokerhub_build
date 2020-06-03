FROM maven:3.6.3-jdk-8 AS MAVEN_BUILD
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM java:8
EXPOSE 8080
WORKDIR /app
COPY --from=MAVEN_BUILD /home/app/target/spring-rest-helloworld.jar /app/
ENTRYPOINT ["java", "-jar", "spring-rest-helloworld.jar"]