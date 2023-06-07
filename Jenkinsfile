/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'node:18.16.0-alpine' } }
    stages {
        stage('Build') {
            steps {
                sh 'node --version'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
                retry(3) {
                  sh 'echo "retrying..."'
                  sh './retry.sh'
                }
            }
        }
    }
}
