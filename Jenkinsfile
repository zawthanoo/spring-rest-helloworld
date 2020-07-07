def POM_VERSION
def GIT_COMMIT_SHORT

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
    
    stage('Initialize the variables') {
      steps {
	    script {
        def pom = readMavenPom file: 'pom.xml'
	      POM_VERSION = "${pom.version}"
	    }
	    script {
	      GIT_COMMIT_SHORT = bat(script: "@git rev-parse --short HEAD", returnStdout: true).trim();
	    }
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
          dockerImage = docker.build registry + ":${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
        }
        echo "Build docker images is done. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
      }
    }
    
    stage('Push Docker Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER")
          }
        }
         echo "Push docker image into DockerHub. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
      }
    }
    
    stage('Remove Unused docker image') {
      steps{
        bat "docker rmi $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
      }
    }    
  }
}