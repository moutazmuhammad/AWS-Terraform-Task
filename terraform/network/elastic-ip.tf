resource "aws_eip" "el-ip-1" {
  vpc        = true
  depends_on = [aws_internet_gateway.my-getway]
}
