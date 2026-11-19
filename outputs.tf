output "id_vpc" {
  description = "ID da VPC"
  value = aws_vpc.clc_vpc.id
}

output "arn_vpc" {
    description = "ARN da VPC"
    value = aws_vpc.clc_vpc.arn
}

## AZ 1a
output "id_public_subnet_1a" {
  description = "ID da Subnet Pública"
  value = aws_subnet.public_subnet_1a.id
}

output "id_private_subnet_1a" {
  description = "ID da Subnet Privada"
  value = aws_subnet.private_subnet_1a.id
}

output "id_private_route_table_1a" {
  description = "ID da Route Table"
  value = aws_route_table.private_rt_1a.id
}

output "id_public_route_table_1a" {
  description = "ID da Route Table"
  value = aws_route_table.public_rt_1a.id
}

output "id_internet_gateway" {
  description = "ID do Internet Gateway"
  value = aws_internet_gateway.gw_clc_vpc.id
}

## AZ 1c
output "id_public_subnet_1c" {
  description = "ID da Subnet Pública"
  value = aws_subnet.public_subnet_1c.id
}

output "id_private_subnet_1c" {
  description = "ID da Subnet Privada"
  value = aws_subnet.private_subnet_1c.id
}

output "id_public_route_table_1c" {
  description = "ID da Route Table"
  value = aws_route_table.public_rt_1c.id
}

output "id_private_route_table_1c" {
  description = "ID da Route Table"
  value = aws_route_table.private_rt_1c.id
}
