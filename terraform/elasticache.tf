resource "aws_elasticache_cluster" "cash_cluster" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.cache_sub_grp.id
  security_group_ids   = [aws_security_group.elasticache_sg.id]
}

resource "aws_elasticache_subnet_group" "cache_sub_grp" {
  name       = "cache-subnet-grp"
  subnet_ids = [module.network.private_subnet2, module.network.private_subnet1]
}