output "Vpcname" {
    value = var.vpc_block
}
output "AMI" {
    value = data.aws_ami.instanceami.id
}
output "instnace1_public_ip_address" {
  value = aws_instance.myinstance1.public_ip
}
