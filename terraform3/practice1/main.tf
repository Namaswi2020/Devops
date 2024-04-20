terraform {
  required_providers {
   aws= {source="hashicorp/aws"
    version="5.45.0"
  }
  }
}

resource "aws_vpc" "testvpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name=var.vpc_name
  }
  provider = aws.southregion
}

resource "aws_vpc" "testvpc1" {
  cidr_block = var.cidr_vpc
  tags = {
    Name=var.vpc_name
  }
  provider = aws.westregion
}
resource "aws_subnet" "subtnet" {
cidr_block = var.subnetcidr
availability_zone = var.subnet_zone
vpc_id = aws_vpc.testvpc.id
tags = {
  Name=var.subnet_name
}
}
resource "aws_subnet" "subtnet1" {
cidr_block = "10.0.0.0/24"
availability_zone = "us-west-1c"
vpc_id = aws_vpc.testvpc1.id
tags = {
  Name=var.subnet_name
}
provider = aws.westregion
}
resource "aws_instance" "myinstance" {
  instance_type = var.instancetype
  subnet_id = aws_subnet.subtnet.id
  ami = var.instance_ami
  provider = aws.southregion
  tags = {
    Name=var.instnace_name
  }
}

resource "aws_instance" "myinstance1" {
  instance_type = var.instancetype
  subnet_id = aws_subnet.subtnet1.id
  ami = var.instance2_ami
  provider = aws.westregion
  tags = {
    Name=var.instnace_name
  }
}

