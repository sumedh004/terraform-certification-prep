provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_ec2" {
  ami           = "ami-06eecef118bbf9259"
  subnet_id     = "subnet-00acc2e6514010256"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2 via terraform"
  }
}