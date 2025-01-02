resource "aws_vpc" "Final-Project" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    name = "Final-Project-vpc"
  }
}

resource "aws_subnet" "Final-Project" {
  vpc_id                  = aws_vpc.Final-Project.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    name = "Final-Project-subnet"
  }
}

resource "aws_internet_gateway" "Final-Project" {
  vpc_id = aws_vpc.Final-Project.id
  tags = {
    name = "Final-Project-gateway"
  }
}

resource "aws_route_table" "Final-Project" {
  vpc_id = aws_vpc.Final-Project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Final-Project.id
  }

  tags = {
    name = "Final-Project-route-table"
  }
}

resource "aws_route_table_association" "Final-Project" {
  subnet_id      = aws_subnet.Final-Project.id
  route_table_id = aws_route_table.Final-Project.id
}
