
variable "cidr_vpc" {
  type=string
  default = "10.0.0.0/16"
}
variable "Vpc_name" {
  type=string
  default="MyVpc"
}
variable "cidr_UATsubnet" {
  type=string
  default = "10.0.0.0/24"
}
variable "UATsubnet_zone" {
    type=string
    default = "ap-south-1a"
}
variable "UATSubnet_name" {
  type=string
  default = "UATsubnet"
}

variable "cidr_Preprodsubnet" {
  type=string
  default = "10.0.0.0/24"
}
variable "preprodsubnet_zone" {
    type=string
    default = "us-west-1c"
}
variable "preprodSubnet_name" {
  type=string
  default = "preprodsubnet"
}
variable "Instancepublickey" {
  type=string
  default = "true"
}

variable "UATinstance_type" {
  type=string
  default = "t2.micro"
}
variable "UATinstance_AMI" {
    type=string
    default = "ami-007020fd9c84e18c7"
  
}
variable "UATinstance_name" {
  type=string
  default = "UATinstance"
}

variable "preprodinstance_type" {
  type=string
  default = "t2.micro"
}
variable "preprodinstance_AMI" {
    type=string
    default = "ami-05c969369880fa2c2"
  
}
variable "preprodinstance_name" {
  type=string
  default = "prepropdinstance"
}
