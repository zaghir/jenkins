// DECLARATIVE 
// node {
// 	stage('Build') {
// 		echo "Build"
// 	}
// 	stage('Test') {
// 		echo "Test"
// 	}
// }


// DECLARATIVE 
pipeline {
	// agent where the build is going to run  , using docker image ,running inside docker image  , pipeline run alwyse with stages 
	agent any  
	
	environment {
		dockerHome = tool 'myDocker'
		mavenHome = tool 'myMaven'
		PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
	}
	// agent docker ---- here we use docker agent with maven image => maven:3.6.3  , look at Dockerfile then execute process
	// agent { docker { image 'maven:3.6.3'}}

    // agent docker ---- here we use docker agent with nodeJs  image => maven:3.6.3  , look at Dockerfile then execute process
	// agent { docker { image 'node:13.8'}}

	stages {
		stage ('Checkout') {
			steps {
				sh 'mvn --version'
				sh 'docker version'
				
				echo "PATH --->  $PATH"

				// for nodeJs
				// sh 'mvn --version'
				echo "Build"
				echo "PATH - $PATH"
				echo "Information from  Pipeline Syntax -> Global Variable Reference "
				echo "BUILD_NUMBER - $env.BUILD_NUMBER"
				echo "BUILD_ID - $env.BUILD_ID"
				echo "JOB_NAME - $env.JOB_NAME"
				echo "BUILD_TAG - $env.BUILD_TAG"
				echo "BUILD_URL - $env.BUILD_URL"
				echo "TAG_DATE - $env.TAG_DATE"
			}
		}
		stage ('Compile') {
			steps {
				echo " Compile ####"
				sh "mvn clean compile"
			}
		}
		stage ('Test') {
			steps {
				echo " Test ####"
				sh "mvn test"
			}
		}
		stage ('Integration Test') {
			steps {
				echo "Integration Test ####"
				sh "mvn failsafe:integration-test failsafe:verify"
			}
		}
		stage ('Package') {
			steps {
				echo "Package ####"
				sh "mvn package -DskipTests"
			}
		}
		
		stage('Build Docker Image') {
			steps {
				// "docker build -t zaghir/currency-exchange-devops:$env.BUILD_TAG"
				script {
					dockerImage = docker.build("zaghir/currency-exchange-devops:${env.BUILD_TAG}")
				}
			}
		}
				
		stage('Push Docker Image') {
			steps {
				script {
					// credential of docker configured in jenkins (globals identifiants)
					// dockerhub  => it's id created in docker credentials  
					// it s a wrapper 
					docker.withRegistry('', 'dockerhub'){
						dockerImage.push();
					    dockerImage.push('latest');
					}
				}
			}
		}
	} 
	post {
		always {
			echo "Im awesome. I run always"
		}
		success {
			echo "I run when you are  successful "
		}
		failure {
			echo "I run when you fail "
		}
		// changed {
		// 	echo "I run when you status of build is changed "
		// }
	}


}