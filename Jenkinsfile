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
    }
    post {
	always { echo "One way or another, I have finished" }
	success { echo "I succeeded!" }
	unstable { echo "I am unstable :/" }
	failure {
		echo "I failed :("
		mail to: "can.liu01@sap.com",
		     subject: "Filed Pipeline: ${currentBuild.fullDisplayName}",
		     body: "Something is wrong with ${env.BUILD_URL}"
	}
	changed { echo "Things were differet before..." }
    }
}
