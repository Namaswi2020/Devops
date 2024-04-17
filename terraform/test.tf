terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
  region="ap-south-1"
}
resource "aws_s3_bucket" "example" {
  bucket = "my-test123-s3bucket"
}
/*
resource "aws_instance" "server" {
  ami                     = "ami-007020fd9c84e18c7"
  instance_type           = "t2.micro"
  tags = {
    Name="server-1"
  }
 
}*/
resource "aws_instance" "server1" {
  ami                     = "ami-007020fd9c84e18c7"
  instance_type           = "t2.micro"
  tags = {
    Name="server-2"
  }
 
}