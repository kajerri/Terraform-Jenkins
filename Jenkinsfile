pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo/terraform-module.git' // Replace with your repo URL
            }
        }
        
        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        
        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -var "aws_access_key=${env.AWS_ACCESS_KEY}" -var "aws_secret_key=${env.AWS_SECRET_KEY}"' 
            }
        }
        
        stage('Apply Terraform') {
            steps {
                sh 'terraform apply -var "aws_access_key=${env.AWS_ACCESS_KEY}" -var "aws_secret_key=${env.AWS_SECRET_KEY}"'
            }
        }
    }
}
