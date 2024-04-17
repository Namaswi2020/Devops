terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "Myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Myvpc1"
  }
}
resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.Myvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Mysubnet"
  }
}

resource "tls_private_key" "publickey" {
  algorithm = "RSA"
  rsa_bits  = 4096


}

resource "aws_key_pair" "mykeypair" {
  key_name   = "test"
  public_key = tls_private_key.publickey.public_key_openssh

}
resource "local_file" "privatekey" {
  content  = tls_private_key.publickey.private_key_openssh
  filename = "/Users/Durga/Desktop/devops.pem"
  

}
data "aws_ami" "myami" {
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-SQL_2019_Web-2024.03.13"]
  }
 
  
}



resource "aws_instance" "myinstance" {
  ami                         = data.aws_ami.myami.id
  subnet_id                   = aws_subnet.mysubnet.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.mykeypair.key_name
  tags = {
    Name = "Myinstance"
  }
}