# --------------------------------------- Outputs-------------------------------------------------------
output "Default_VPC" {
  value = aws_default_vpc.default.id
}


output "default_vpc_arn" {
  value = aws_default_vpc.default.arn
}


output "default_vpc_cidr" {
  value = aws_default_vpc.default.cidr_block
}


/*
output "Subnet1" {
  value = aws_subnet.Elad_subnet1.id
}

output "Subnet2" {
  value = aws_subnet.Elad_subnet2.id
}
*/

output "security_group" {
  value = aws_security_group.Elad_Security_Group.id
}