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

        stage('Docker Build') {
            steps {
                sh 'docker build -t zepto-app .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker stop zepto-container || true'
                sh 'docker rm zepto-container || true'
                sh 'docker run -d -p 3333:80 --name zepto-container zepto-app'
            }
        }
    }
}
