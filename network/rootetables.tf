
resource "aws_route_table" "root-public1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-getway.id
  }

  tags = {
    Name = "public1"
  }
}

resource "aws_route_table_association" "a-public1" {
  subnet_id      = aws_subnet.public-one.id
  route_table_id = aws_route_table.root-public1.id
}

resource "aws_route_table_association" "a-public2" {
  subnet_id      = aws_subnet.public-two.id
  route_table_id = aws_route_table.root-public1.id
}



resource "aws_route_table" "root-private-1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = "private1"
  }
}

resource "aws_route_table_association" "a-private1" {
  subnet_id      = aws_subnet.private-one.id
  route_table_id = aws_route_table.root-private-1.id
}


resource "aws_route_table_association" "a-private2" {
  subnet_id      = aws_subnet.private-two.id
  route_table_id = aws_route_table.root-private-1.id
}