module "network" {
  source                = "./network"
  region                = var.region
  availability_zone_one = var.availability_zone_one
  availability_zone_two = var.availability_zone_two
  vpc_cidr              = var.vpc_cidr
  name                  = var.name
  public_subnet1_cidr   = var.public_subnet1_cidr
  public_subnet2_cidr   = var.public_subnet2_cidr
  private_subnet1_cidr  = var.private_subnet1_cidr
  private_subnet2_cidr  = var.private_subnet2_cidr
}