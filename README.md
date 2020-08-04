## This project is testing for CI/DI pipeline for github, jenkins and dockerhub

JVM Memory Config & Run Commend
--------------------------------
    java -Xms1024m -Xmx1024m -XX:NewRatio=3 -XX:SurvivorRatio=6 -Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml -jar spring-rest-helloworld.jar 
