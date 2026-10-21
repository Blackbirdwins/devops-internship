pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code checkout ho raha hai...'
                git branch: 'main', url: 'https://github.com/Blackbirdwins/devops-internship.git'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker image ban rahi hai...'
                // App folder mein jao aur Docker image build karo (Maven Dockerfile ke andar hai)
                sh 'cd "Internship backend/day8/books-api-source" && docker build -t anas17702/books-api:latest .'
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
