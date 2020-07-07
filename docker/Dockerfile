FROM anapsix/alpine-java:8
RUN mkdir -p /usr/local/myapp
EXPOSE 8080
COPY ./app/*.jar /usr/local/myapp
ENTRYPOINT ["java", "-jar", "/usr/local/myapp/spring-rest-helloworld.jar"]
