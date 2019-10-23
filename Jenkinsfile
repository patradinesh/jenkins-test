
pipeline {
    agent {
        label ""
    }
    stages {
        stage('Build') {
            steps {
                echo "Hello Jenkins!! This is Build Phase "
            }
        }
        stage('Package') {
            steps {
                echo "Hello Jenkins!! This is Package Phase "
            }
        }
        stage('Test') {
            steps {
                echo "Hello Jenkins!! This is Test Phase "
            }
        }
        stage('Deploy') {
            steps {
                echo "Hello Jenkins!! This is Deploy Phase "
            }
        }
        stage('Validate') {
            steps {
                echo "Hello Jenkins!! This is Validate Phase "

        }
        slackSend channel: 'aws-devops-colloboration', message: 'test'
      }
    }
}
