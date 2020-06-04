pipeline {
  environment {
    registry = "zawthanoo/spring_jenkings"
    registryCredential = 'DockerHub_Credential'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/zawthanoo/spring-rest-helloworld.git'
      }
    }

    stage('Build Package') {
      steps {
          bat 'mvn package'
      }
    }
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    
    stage('Remove Unused docker image') {
      steps{
        bat "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    
  }
}