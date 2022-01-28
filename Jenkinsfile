pipeline {
    agent { label 'next-node' }
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'docker build -t exatel .'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'docker run exatel'
            }
        }
    }
}
