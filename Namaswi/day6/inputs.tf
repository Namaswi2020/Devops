variable "vpc_block" {
  type=list(string)
  default = ["10.0.0.0/16","myvpc"]
}
variable "gateway_block" {
  type=string
  default = "mygateway"
}
variable "subnet_block" {
  type=list(string)
  default = [ "10.0.0.0/24","ap-south-1a","mysubnet" ]
}
variable "publickey" {
  type=list(string)
  default = [ "RSA","4096" ]
}

variable "keypair" {
  type=string
  default = "sample"
}
variable "privatekey" {
  type=string
  default = "/Users/Durga/Desktop/devops.pem"
}
 variable "instance_block" {
   type=list(string)
   default = [ "t2.micro","true","myinstance" ]
 }