terraform {
  required_providers {
    aws={source = "hashicorp/aws"
    version = "5.46.0"}
  }
}
resource "aws_vpc" "Vpc" {
    cidr_block = var.vpc_block[0]
    tags = {
      Name=var.vpc_block[1]
    }
}
resource "aws_internet_gateway" "Gateway" {
  tags = {
    Name=var.gateway_block
  }
  vpc_id = aws_vpc.Vpc.id
}
resource "aws_internet_gateway_attachment" "Gatewayattachment" {
  internet_gateway_id = aws_internet_gateway.Gateway.id
  vpc_id = aws_vpc.Vpc.id
}
resource "aws_subnet" "Subnet" {
  cidr_block = var.subnet_block[0]
  availability_zone = var.subnet_block[1]
  vpc_id = aws_vpc.Vpc.id
  tags={
    Name=var.subnet_block[2]
  }
}
resource "tls_private_key" "public_key" {
  algorithm = "RSA"
  rsa_bits = 4096
    
  }

resource "aws_key_pair" "mykeypair" {
  key_name   = "sample"
  public_key = tls_private_key.public_key.public_key_openssh
}

resource "local_file" "privateKey" {
  content  = tls_private_key.public_key.private_key_openssh
  filename = "/Users/Durga/OneDrive/Desktop/devops/terraform3/Namaswi.pem"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_SSH"
  description = "Allow SSH "
  vpc_id      = aws_vpc.Vpc.id

  ingress {
  
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myinstance1" {
  ami                         = data.aws_ami.instanceami.id
  subnet_id                   = aws_subnet.Subnet.id
  key_name                    = aws_key_pair.mykeypair.key_name
  instance_type               = var.instance_block[0]
  tags = {
    Name ="instance1"
  }
  security_groups = [aws_security_group.allow_ssh.id]
  user_data = "${file("userdata.sh")}"
}


resource "aws_instance" "myinstance2" {
  ami                         = data.aws_ami.instanceami.id
  subnet_id                   = aws_subnet.Subnet.id
  key_name                    = aws_key_pair.mykeypair.key_name
  instance_type               = var.instance_block[1]
  tags = {
    Name = "instance2"
  }
  security_groups = [aws_security_group.allow_ssh.id]
  user_data = "${file("userdata.sh")}"
}
