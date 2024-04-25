
output "instnace1_public_ip_address" {
  value = aws_instance.myinstance.public_ip
}

output "instnace1_private_ip_address" {
  value = aws_instance.myinstance.private_ip
}