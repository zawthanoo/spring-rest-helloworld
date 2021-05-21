FROM openjdk:8-jdk-alpine
RUN mkdir -p /opt/spring/config
RUN mkdir -p /opt/spring/bin
COPY /scripts/* /opt/spring/bin/
COPY /apps/*.jar /opt/spring/
RUN chmod +x /opt/spring/bin/post-started-app
RUN chmod +x /opt/spring/bin/pre-stopped-app
ENTRYPOINT [ "sh", "-c", "java -Xms${MAX_JVM_MEMORY}m -Xmx${MIN_JVM_MEMORY}m -XX:NewRatio=${JVM_MEMORY_NEW_RATIO} -XX:SurvivorRatio=${MVM_MEMORY_SURVIVOR_RATIO} -Dspring.config.location=classpath:application-config.yaml,file:///opt/spring/config/application-config-override.yaml,classpath:application-secret.yaml,file:///opt/spring/config/application-secret-override.yaml, -jar /usr/spring/spring-rest-helloworld.jar" ]
