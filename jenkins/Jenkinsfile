def POM_VERSION
def GIT_COMMIT_SHORT

pipeline {
  environment {
    registry = "zawthanoo/wmt-mfs-merchant-exp"
    registryCredential = 'zto-dockerhub-credentials'
    dockerImage = ''
  }

  agent any
  
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/DigitalMoneyMyanmar/wmt-mfs-merchant-exp.git'
      }
    }
    
    stage('Initialize the variables') {
      steps {
	    script {
        def pom = readMavenPom file: 'pom.xml'
	      POM_VERSION = "${pom.version}"
	    }
	    script {
	      GIT_COMMIT_SHORT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim();
	    }
      }
    }
    
    stage('Build Package') {
      steps {
        sh 'mvn package'
      }
    }
    
    stage('Build Docker Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
          echo "Build docker images is done. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
        }   
      }
    }

    stage('Push Docker Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {            
            dockerImage.push()
            echo "Push docker image into DockerHub. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
          }
        }   
      }
    }
        
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
      }
    }    
  }
}
