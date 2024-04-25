data "aws_ami" "myami" {
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-SQL_2019_Web-2024.03.13"]
  }
  
}
data "aws_key_pair" "keypair"{
     key_name  = "sample"
  include_public_key = true
}