
# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Replace with your preferred region
}

# Define the instance
resource "aws_instance" "sonarqube" {
  ami           = "ami-0c9978668f8d55984"  # SonarQube AMI for us-west-2
  instance_type = "t2.medium"             # Use t2.medium instance type
  key_name      = "Myserver1"         # Replace with your key name
  #vpc_security_group_ids = ["sg-0123456789abcdef"]  # Replace with your security group ID

  # User data script to install SonarQube
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install java-1.8.0-openjdk -y
              sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.2.46101.zip
              sudo unzip sonarqube-8.9.2.46101.zip
              sudo mv sonarqube-8.9.2.46101 /opt/sonarqube
              sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start
              EOF
}

# Define an output for the instance's public IP address
output "sonarqube_public_ip" {
  value = aws_instance.sonarqube.public_ip
}

