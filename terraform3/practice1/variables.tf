variable "cidr_vpc" {
  type=string
  #default = "10.0.0.0/16"
}
variable "vpc_name" {
  type = string
  #default = "myvpc"
}
variable "subnetcidr" {
  type=string
  #default = "10.0.0.0/24"

}
variable "subnet_zone" {
  type=string
  default = "ap-south-1a"
}
variable "subnet_name" {
  type=string
  default = "mysubnet"
}
variable "instancetype" {
  type=string
  default = "t2.micro"
}
variable "instance_ami" {
  type=string
  default = "ami-007020fd9c84e18c7"
}
variable "instance2_ami" {
  type = string
  default = "ami-05c969369880fa2c2"
  
}
variable "instnace_name1" {
  type=string
  default = "myinstance2"
}
variable "instnace_name" {
  type=string
  default = "myinstance1"
}
