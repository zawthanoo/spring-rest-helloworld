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
        withmaven(maven : 'maven_3.6.3') {
          sh 'mvn package'
        }
      }
    }

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage('Test Mkdocs' ) {
        agent {
            docker { image 'zawthanoo/spring_jenkings:$BUILD_NUMBER' }
        }
        steps {
            sh 'zawthanoo --version'
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
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
