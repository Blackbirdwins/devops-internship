pipeline {
    agent any

    stages {
        stage('Checkout Backend Code') {
            steps {
                echo 'Backend code clone ho raha hai...'
                // Purana folder delete karo, phir fresh clone karo
                sh 'rm -rf backend-code && git clone https://github.com/Blackbirdwins/internship-backend.git backend-code'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Docker image ban rahi hai...'
                // Backend folder ke andar jao aur Docker image build karo
                sh 'cd backend-code/day8/books-api-source && docker build -t anas17702/books-api:latest .'
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
