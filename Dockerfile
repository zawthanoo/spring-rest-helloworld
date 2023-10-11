FROM openjdk:17.0.2-jdk
ENV TZ="Asia/Singapore"
RUN mkdir -p /opt/mutu/config 
ADD target/springboot-poc.jar /opt/mutu/
WORKDIR /opt/mutu
ENTRYPOINT [ "sh", "-c", "java -jar /opt/mutu/springboot-poc.jar --spring.config.additional-location=file:///opt/mutu/config/ --spring.config.name=application,application_config_override,application_secret_override" ]
