resource "aws_subnet" "public-one" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet1_cidr
  # "10.0.0.0/24"
  availability_zone       = var.availability_zone_one
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-one"
  }
}

resource "aws_subnet" "public-two" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet2_cidr
  # "10.0.2.0/24"
  availability_zone       = var.availability_zone_two
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-two"
  }
}

resource "aws_subnet" "private-one" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet1_cidr
  # "10.0.1.0/24"
  availability_zone = var.availability_zone_one
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.name}-private-one"
  }
}

resource "aws_subnet" "private-two" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet2_cidr
  # "10.0.3.0/24"
  availability_zone = var.availability_zone_two
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.name}-private-two"
  }
}


# subnet group
resource "aws_db_subnet_group" "private_subnet_group" {
  name = "private_subnets"
  subnet_ids = [
    aws_subnet.private-one.id,
    aws_subnet.private-two.id
  ]

  tags = {
    Name = "My DB subnet group"
  }
}