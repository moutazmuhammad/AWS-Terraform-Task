region                = "eu-east-1" # Ireland
availability_zone_one = "eu-east-1a"
availability_zone_two = "eu-east-1b"
ami                   = "ami-04505e74c0741db8d"
vpc_cidr              = "10.0.0.0/16"
name                  = "dev"
public_subnet1_cidr   = "10.0.0.0/24"
public_subnet2_cidr   = "10.0.2.0/24"
private_subnet1_cidr  = "10.0.1.0/24"
private_subnet2_cidr  = "10.0.3.0/24"

# For RDS DB
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t3.micro"
db_name              = "mydb"
username             = "user1"
password             = "password"
parameter_group_name = "default.mysql5.7"




# to create new workspace:
# terraform workspace new dev

# To know the current workspace
# terraform workspace show

# To switch to anther workspace
# terraform workspace select new_of_anther_workspace

# To delete workspace 
# terraform workspace delete name_of_work_space


# command
# terraform plan --var-file dev.tfvars 
# terraform apply --var-file dev.tfvars


# if the name of file "tarraform.tfvars"
# you can use normal command 
# terraform plan

