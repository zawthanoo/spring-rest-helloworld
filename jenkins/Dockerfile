FROM openjdk:8-jdk-alpine
RUN mkdir -p /usr/local/myapp/config
COPY /apps/spring-rest-helloworld.jar /usr/local/myapp/spring-rest-helloworld.jar
#ENTRYPOINT [ "sh", "-c", "java -Xms${MAX_JVM_MEMORY}m -Xmx${MIN_JVM_MEMORY}m -XX:NewRatio=${JVM_MEMORY_NEW_RATIO} -XX:SurvivorRatio=${MVM_MEMORY_SURVIVOR_RATIO} -Dspring.config.location=classpath:application-config.yaml,file:///usr/local/myapp/config/application-config-override.yaml,classpath:application-secret.yaml,file:///usr/local/myapp/config/application-secret-override.yaml, -jar /usr/local/myapp/spring-rest-helloworld.jar" ]
#ENTRYPOINT [ "sh", "-c", "java -Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml, -jar /usr/local/myapp/spring-rest-helloworld.jar" ]
ENTRYPOINT ["java","-Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml","-jar","/usr/local/myapp/spring-rest-helloworld.jar"]
