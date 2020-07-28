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
	agent any  // agent where the build is going to run  , using docker image ,running inside docker image  , pipeline run always with stages 
	stages {
		stage ('Build') {
			steps {
				echo "Build"
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