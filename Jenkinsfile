pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kajerri/Terraform-Jenkins.git' // Replace with your repo URL
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
