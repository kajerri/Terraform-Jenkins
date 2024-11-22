pipeline {
    agent any

    environment {
        // Replace 'AWS_ACCESS_KEY_ID' and 'AWS_SECRET_ACCESS_KEY' with your Jenkins credentials' IDs
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Cloning the GitHub repository containing the Terraform code
                git branch: 'main', url: 'https://github.com/kajerri/Terraform-Jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        always {
            // Clean up the workspace to ensure no sensitive information persists
            cleanWs()
        }
    }
}
