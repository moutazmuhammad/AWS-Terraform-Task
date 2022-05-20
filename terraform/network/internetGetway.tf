resource "aws_internet_gateway" "my-getway" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "internet_getway"
  }
}