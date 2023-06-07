/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'node:18.16.0-alpine' } }
    environment {
	HOST = "www.google.com"
    }
    stages {
        stage('Build') {
            steps {
                sh 'node --version'
                sh '''
                    echo "Multiline shell steps works too"
                    echo 1 > temp.txt
                    ls -lah
                '''
                retry(3) {
                  sh 'echo "retrying..."'
                  sh './retry.sh'
                }
		sh 'echo "HOST is ${HOST}"'
            }
        }
	stage('Deploy - sainity check') {
	    steps {
		input "Does the staging environment look ok?"
	    }
	}
    }
    post {
	always { echo "One way or another, I have finished" }
	success { echo "I succeeded!" }
	unstable { echo "I am unstable :/" }
	failure {
		echo "I failed :("
		echo "Filed Pipeline: ${currentBuild.fullDisplayName}"
		echo "Something is wrong with ${env.BUILD_URL}"
	}
	changed { echo "Things were differet before..." }
    }
}
