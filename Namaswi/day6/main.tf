terraform {
  required_providers {
    aws={source = "hashicorp/aws"
    version = "5.46.0"}
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "Myvpc" {
  cidr_block = var.vpc_block[0]
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_block[1]
  }
}
resource "aws_internet_gateway" "Gateway" {
  tags = {
    Name=var.gateway_block
  }
  vpc_id = aws_vpc.Myvpc.id
}

resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.Myvpc.id
  cidr_block        = var.subnet_block[0]
  availability_zone = var.subnet_block[1]
  tags = {
    Name = var.subnet_block[2]
  }
}
/*
resource "tls_private_key" "publickey" {
  algorithm = var.publickey[0]
  rsa_bits  =var.publickey[1]


}

resource "aws_key_pair" "mykeypair" {
  key_name   = var.keypair
  public_key = tls_private_key.publickey.public_key_openssh

}
resource "local_file" "privatekey" {
  content  = tls_private_key.publickey.private_key_openssh
  filename = var.privatekey
  

}
*/

resource "aws_instance" "myinstance" {
  ami                         = data.aws_ami.myami.id
  subnet_id                   = aws_subnet.mysubnet.id
  associate_public_ip_address = var.instance_block[1]
  instance_type               = var.instance_block[0]
  key_name                    = data.aws_key_pair.keypair.key_name
  
  tags = {
    Name = var.instance_block[2]
  }
}