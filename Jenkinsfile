def POM_VERSION
def GIT_COMMIT_SHORT

pipeline {
    environment {
        registry = "zawthanoo/spring-rest-helloworld"
        registryCredential = 'zto-dockerhub-credentials'
        dockerImage = ''
    }

    agent none

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
                    GIT_COMMIT_SHORT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim();
                }
            }
        }

        stage('Build Package') {
            agent {
                docker {
                    image 'maven:3.8.1-adoptopenjdk-11'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            stage("build") {
                steps {
                    sh 'mvn package'
                }
            }
        }

        stage('Build Docker') {
            agent {
                label 'docker'
            }
			stages('Build Docker') {
                stage('Build Docker Image') {
                    steps {
                        script {
                            dockerImage = docker.build registry + ":${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
                            echo "Build docker images is done. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
                        }
                    }
                }

				stage('Push Docker Image') {
					steps {
						script {
							docker.withRegistry('', registryCredential) {
								dockerImage.push()
								echo "Push docker image into DockerHub. $registry:${POM_VERSION}-${GIT_COMMIT_SHORT}-$BUILD_NUMBER"
							}
						}
					}
				}
			}
        }
    }
}
