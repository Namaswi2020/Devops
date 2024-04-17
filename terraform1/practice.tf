terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
  region="us-east-1"
}
resource "aws_vpc" "vpc123" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpc1"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc123.id
  cidr_block        = "10.0.0.0/16"
  availability_zone = "us-east-1e"
  tags = {
    Name = "mysubnet"
  }
}
resource "aws_instance" "webserver1" {
  ami                     = "ami-080e1f13689e07408"
  instance_type           = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
   
  tags = {
    Name="myec2server1"
   
  }
}

resource "aws_instance" "webserver2" {
  ami                     = "ami-080e1f13689e07408"
  instance_type           = "t2.micro"
  subnet_id     = aws_subnet.subnet1.id
  associate_public_ip_address="true"
   
  tags = {
    Name="myec2server2"
   
  }
}

