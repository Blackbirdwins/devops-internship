pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = 'blackbirdwins'
        DOCKER_HUB_PASS = credentials('DOCKER_PASSWORD')  // Jenkins mein save kiya hua password
        IMAGE_NAME = "blackbirdwins/books-api:latest"
    }

    stages {
        stage('Checkout Backend Code') {
            steps {
                echo 'Backend code clone ho raha hai...'
                sh 'rm -rf backend-code && git clone https://github.com/Blackbirdwins/internship-backend.git backend-code'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker image ban rahi hai...'
                sh 'cd backend-code/day8/books-api-source && docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Docker Hub pe push ho raha hai...'
                sh 'echo $DOCKER_HUB_PASS | docker login -u $DOCKER_HUB_USER --password-stdin'
                sh 'docker push $IMAGE_NAME'
            }
        }
    }

    post {
        success {
            echo 'Pipeline successfully pass ho gaya!'
        }
        failure {
            echo 'Pipeline fail ho gaya. Logs check karo.'
        }
    }
}
