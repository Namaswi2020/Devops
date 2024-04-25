/*
variable "vpc_cidr" {
  type=string
  description = "cidr for vpc"
  default = "10.0.0.0/16"
}

variable "Vpc_name" {
    type=string
    description = "name of vpc"
    default = "myvpc"
  
}
variable "subnet_cidr" {
  type = string
  description = "cidr for vpc"

}
*/
variable "gateway_block" {
  type=string
  default = "mygateway"

}
variable "vpc_block" {
  type=list(string)
  default = [ "10.0.0.0/16","myvpc" ]
}

variable "subnet_block" {
    type=list(string)
    default = [ "10.0.0.0/24","ap-south-1a","mysubnet" ]
  
}
variable "instance_block" {
  type=list(string)
  default = [ "t4g.nano","t4g.micro" ]
  
}

