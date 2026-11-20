# Terraform configuration for creating a VPC and subnets

# VPC resource
resource "aws_vpc" "clc_vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-terraform-cicd"
  }
}

# Public Subnet resource
resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet-1a"
  }
}

# Private Subnet resource
resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1a"
  }
}

# Internet Gateway resource
resource "aws_internet_gateway" "gw_clc_vpc" {
  vpc_id = aws_vpc.clc_vpc.id

  tags = {
    Name = "igw-clc-vpc"
  }
}


# Route Table resource
resource "aws_route_table" "public_rt_1a" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_clc_vpc.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate the public subnet with the route table
resource "aws_route_table_association" "rt_public_association_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt_1a.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_gw_eip_1a" {
  domain   = "vpc"
}

# Nat Gateway resource az 1a
resource "aws_nat_gateway" "nat_gw_1a" {
  allocation_id = aws_eip.nat_gw_eip_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "nat-gateway-1a-tf"
  }

  depends_on = [aws_internet_gateway.gw_clc_vpc]
}

# Private Route Table resource
resource "aws_route_table" "private_rt_1a" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1a.id
  }

  tags = {
    Name = "private-rt"
  }
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "rt_private_association_subnet_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt_1a.id
}


## us-east-1c
# Public Subnet resource
resource "aws_subnet" "public_subnet_1c" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public-subnet-1c"
  }
}

# Private Subnet resource
resource "aws_subnet" "private_subnet_1c" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.20.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-subnet-1c"
  }
}


# Route Table resource
resource "aws_route_table" "public_rt_1c" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_clc_vpc.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate the public subnet with the route table
resource "aws_route_table_association" "rt_public_association_subnet_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt_1c.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_gw_eip_1c" {
  domain   = "vpc"
}

# Nat Gateway resource az 1c
resource "aws_nat_gateway" "nat_gw_1c" {
  allocation_id = aws_eip.nat_gw_eip_1c.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  tags = {
    Name = "nat-gateway-1c-tf"
  }

  depends_on = [aws_internet_gateway.gw_clc_vpc]
}

# Private Route Table resource
resource "aws_route_table" "private_rt_1c" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1c.id
  }

  tags = {
    Name = "private-rt"
  }
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "rt_private_association_subnet_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt_1c.id
}