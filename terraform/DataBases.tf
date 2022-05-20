resource "aws_db_instance" "my-RDS" {
  # Allocating the storage for database instance.
  allocated_storage = 10
  # Declaring the database engine and engine_version
  engine         = var.engine
  engine_version = var.engine_version
  # Declaring the instance class
  instance_class = var.instance_class
  db_name        = var.db_name
  # User to connect the database instance 
  username = var.username
  # Password to connect the database instance 
  password             = var.password
  parameter_group_name = var.parameter_group_name

  # private subnet group
  db_subnet_group_name   = module.network.private_sub_gp_name
  vpc_security_group_ids = [aws_security_group.private_access.id]
  # to delete database when destroy
  skip_final_snapshot     = true
  backup_retention_period = 0
}

# ---------------------------------------------------------------------


