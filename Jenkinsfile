pipeline {
    agent any

    tools {
        nodejs 'NodeJS'
    }

    stages {

        stage('Checkout') {
            steps {
             checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitCreds', url: 'https://github.com/Subhash-Rokkala/netflix.git']])
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build React App') {
            steps {
                sh 'CI=false npm run build'
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
