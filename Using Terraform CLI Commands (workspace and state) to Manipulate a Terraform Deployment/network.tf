resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${terraform.workspace}-vpc"
  }

}


data "aws_availability_zones" "azs" {
  state = "available"
}


resource "aws_subnet" "subnet" {
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "${terraform.workspace}-subnet"
  }
}



resource "aws_security_group" "sg" {
  name        = "${terraform.workspace}-sg"
  description = "Allow TCP/22"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${terraform.workspace}-securitygroup"
  }
}