output vpc_id {
  value       = aws_vpc.myvpc.id
}

output vpc_cidr {
  value       = aws_vpc.myvpc.cidr_block
}

output public_subnet1 {
  value       = aws_subnet.public-one.id
}

output public_subnet2 {
  value       = aws_subnet.public-two.id
}

output private_subnet1 {
  value       = aws_subnet.private-one.id
}

output private_subnet2 {
  value       = aws_subnet.private-two.id
}

output private_sub_gp_name {
  value       = aws_db_subnet_group.private_subnet_group.name
}
