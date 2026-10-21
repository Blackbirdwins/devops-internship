pipeline {
    agent any

    tools {
        // Jenkins ko Maven ka path batao (agar configured hai)
        maven 'Maven-3.9' 
    }

    environment {
        // Docker Hub credentials (Jenkins mein add karne honge)
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-creds')
        IMAGE_NAME = "anas17702/books-api:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Code checkout ho raha hai...'
                // GitHub se code pull karo
                git 'https://github.com/Blackbirdwins/devops-internship.git'
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Maven Build chalu hai...'
                // Maven project build karo
                sh 'cd "Internship backend/day8/books-api-source" && mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker image ban rahi hai...'
                // Docker image build karo
                sh 'cd "Internship backend/day8/books-api-source" && docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Docker image Hub pe push ho rahi hai...'
                // Docker Hub pe login aur push
                sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
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
