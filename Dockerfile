FROM openjdk:8
RUN mkdir -p /usr/local/myapp
EXPOSE 8080
COPY /target/spring-rest-helloworld.jar /usr/local/myapp/spring-rest-helloworld.jar
ENTRYPOINT ["java", "-jar", "/usr/local/myapp/spring-rest-helloworld.jar"]
