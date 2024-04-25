terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

resource "aws_vpc" "MYvpc1" {
  cidr_block= var.cidr_vpc
  tags={
    Name= var.Vpc_name
  }
  provider=aws.APsouth
}

resource "aws_vpc" "MYvpc2" {
  cidr_block= var.cidr_vpc
  tags={
    Name=var.Vpc_name
  }
  provider=aws.uswest
}

resource "aws_subnet" "UATsubnet" {
       vpc_id = aws_vpc.MYvpc1.id
  cidr_block = var.cidr_UATsubnet
  availability_zone = var.UATsubnet_zone
 
  tags={
    Name=var.UATSubnet_name
  }
  provider = aws.APsouth
  }

  resource "aws_subnet" "Preprodsubnet" {
  cidr_block = var.cidr_Preprodsubnet
  availability_zone = var.preprodsubnet_zone
    vpc_id = aws_vpc.MYvpc2.id
  tags={
    Name=var.preprodSubnet_name
  }
  provider = aws.uswest
  }
  resource "aws_instance" "UATinstance" {
ami=var.UATinstance_AMI
instance_type=var.UATinstance_type
subnet_id=aws_subnet.UATsubnet.id
associate_public_ip_address =var.Instancepublickey
tags={
    Name=var.UATinstance_name
}
 provider=aws.APsouth
  }

    resource "aws_instance" "Preprodinstance" {
ami=var.preprodinstance_AMI
instance_type=var.preprodinstance_type
subnet_id=aws_subnet.Preprodsubnet.id
associate_public_ip_address =var.Instancepublickey
tags={
    Name=var.preprodinstance_name
}
 provider=aws.uswest
  }
