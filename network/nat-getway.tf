resource "aws_nat_gateway" "nat1" {
  subnet_id     = aws_subnet.public-one.id
  allocation_id = aws_eip.el-ip-1.id
  tags = {
    Name = "gw NAT 1"
  }
}