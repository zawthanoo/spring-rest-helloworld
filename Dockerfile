FROM anapsix/alpine-java:8
RUN mkdir -p /usr/local/myapp/config
EXPOSE 8080
COPY /target/spring-rest-helloworld.jar /usr/local/myapp/spring-rest-helloworld.jar
#ENTRYPOINT [ "sh", "-c", "java -Xms${MAX_JVM_MEMORY}m -Xmx${MIN_JVM_MEMORY}m -XX:NewRatio=${JVM_MEMORY_NEW_RATIO} -XX:SurvivorRatio=${MVM_MEMORY_SURVIVOR_RATIO} -Dspring.config.location=classpath:application-config.yaml,file:///usr/local/myapp/config/application-config-override.yaml,classpath:application-secret.yaml,file:///usr/local/myapp/config/application-secret-override.yaml, -jar /usr/local/myapp/spring-rest-helloworld.jar" ]
ENTRYPOINT [ "sh", "-c", "java -Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml, -jar /usr/local/myapp/spring-rest-helloworld.jar" ]
