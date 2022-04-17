region                = "eu-central-1" # Lindon
availability_zone_one = "eu-central-1a"
availability_zone_two = "eu-central-1b"
ami                   = "ami-0d527b8c289b4af7f"
vpc_cidr              = "192.0.0.0/16"
name                  = "prod"
public_subnet1_cidr   = "192.0.0.0/24"
public_subnet2_cidr   = "192.0.2.0/24"
private_subnet1_cidr  = "192.0.1.0/24"
private_subnet2_cidr  = "192.0.3.0/24"

# For RDS DB
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
db_name              = "mydb"
username             = "user1"
password             = "password"
parameter_group_name = "default.mysql5.7"


# to create new workspace:
# terraform workspace new prod

# To know the current workspace
# terraform workspace show

# To switch to anther workspace
# terraform workspace select new_of_anther_workspace

# command
# terraform plan --var-file prod.tfvars 
# terraform apply --var-file prod.tfvars


# if the name of file "tarraform.tfvars"
# you can use normal command 
# terraform plan
