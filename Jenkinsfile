pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        credentialsId: 'GitCreds',
                        url: 'https://github.com/Subhash-Rokkala/netflix.git'
                    ]]
                )
            }
        }

        stage('Create Artifact') {
            steps {
                sh '''
                rm -rf artifact
                mkdir artifact
                cp -r public/* artifact/ 2>/dev/null || true
                cp -r *.html artifact/ 2>/dev/null || true
                cp -r *.js artifact/ 2>/dev/null || true
                cp -r *.css artifact/ 2>/dev/null || true
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build --no-cache -t zepto-app .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f zepto-container || true
                docker run -d -p 3334:80 --name zepto-container zepto-app
                '''
            }
        }
    }
}
