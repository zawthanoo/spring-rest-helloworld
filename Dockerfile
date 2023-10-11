FROM openjdk:17.0.2-jdk
ENV TZ="Asia/Singapore"
RUN mkdir -p /opt/mutu/config 
ADD target/spring-rest-helloworld.jar /opt/mutu/
WORKDIR /opt/mutu
ENTRYPOINT [ "sh", "-c", "java -jar /opt/mutu/spring-rest-helloworld.jar --spring.config.additional-location=file:///opt/mutu/config/ --spring.config.name=application,application_config_override,application_secret_override" ]
