provider "aws" "tomcatserver"{ 
	region = "us-east-1"
} 
resource "aws_instance" "AwsInstance"{
	ami = "ami-0c9978668f8d55984"
	instance_type = "t2.micro"
	key_name = "Myserver1"
	security_groups = ["launch-wizard-25"]
	tags = {
	  Name = "tomcatserver"
    }
}
