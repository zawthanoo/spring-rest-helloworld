## This project is testing for CI/DI pipeline for github, jenkins and dockerhub

JVM Memory Config & Run Commend
--------------------------------
    java -Xms1024m -Xmx1024m -XX:NewRatio=3 -XX:SurvivorRatio=6 -Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml -jar spring-rest-helloworld.jar 


Eclipse JVM Parameter
--------------------------------
    -Dspring.config.location=classpath:application-config.yaml,classpath:application-secret.yaml

Custom Jenkins_Dockerfile + docker-ce
----------------------------
```Dockerfile
FROM jenkins/jenkins
USER root
RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce
RUN apt-get install -y docker-ce
RUN usermod -a -G docker jenkins
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins
```
Run Custom Jenkins Container
--------------------------------
    $docker volume create --name jenkins_data --opt type=none --opt device=/home/zawthanoo/jenkins/data --opt o=bind
    $docker volume create --name jenkins_log --opt type=none --opt device=/home/zawthanoo/jenkins/log --opt o=bind
    $docker run -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 --name=jenkins_docker --mount source=jenkins_log,target=/var/log/jenkins --mount source=jenkins_data,target=/var/jenkins_home -d zawthanoo/jenkins:1.0
