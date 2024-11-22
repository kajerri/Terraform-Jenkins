provider "aws" {
    region = "us-east-1"  
}

resource "aws_iam_user" "jnks" {
  name = "jenkins-user"

  tags = {
    created-from = "jenkins server"
  }
}
