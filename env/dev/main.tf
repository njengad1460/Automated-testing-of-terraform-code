provider "aws" {
  region = "af-south-1"
}
module "networking" {
  source = "../../modules/networking"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zones = var.availability_zones
  environment        = var.environment
}
