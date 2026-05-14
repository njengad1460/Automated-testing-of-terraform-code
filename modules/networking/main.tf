# Step 1 create a VPC 
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

# Step 2 create a public subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.availability_zones[0]
    map_public_ip_on_launch = true
    tags = {
        Name        = "${var.environment}-public-subnet"
        Environment = var.environment
    }
}

# Step 3 create an internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name        = "${var.environment}-igw"
    }
}

# Step 4 create a route table
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name        = "${var.environment}-public-route-table"
    }
}

# Step 5 associate the route table with the public subnet
resource "aws_route_table_association" "public_access" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}