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
	
	// agent docker ---- here we use docker agent with maven image => maven:3.6.3  , look at Dockerfile then execute process
	// agent { docker { image 'maven:3.6.3'}}

    // agent docker ---- here we use docker agent with nodeJs  image => maven:3.6.3  , look at Dockerfile then execute process
	// agent { docker { image 'node:13.8'}}

	stages {
		stage ('Build') {
			steps {
				// sh 'mvn --version'

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
		stage ('Test') {
			steps {
				echo "Test"
			}
		}
		stage ('Integration Test') {
			steps {
				echo "Integration Test"
			}
		}
	} 
	post {
		alwyse {
			echo "Im awesome. I run alwyse"
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