FROM anapsix/alpine-java:8
EXPOSE 8080
ADD /target/spring-rest-helloworld.jar spring-rest-helloworld.jar
ENTRYPOINT ["java", "-jar", "spring-rest-helloworld.jar"]