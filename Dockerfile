FROM maven:3.6.3-jdk-8 AS AS MAVEN_BUILD
RUN mvn package

FROM java:8
EXPOSE 8080
WORKDIR /app
COPY --from=MAVEN_BUILD /target/spring-rest-helloworld.jar /app/
ENTRYPOINT ["java", "-jar", "spring-rest-helloworld.jar"]