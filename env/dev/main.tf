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

module "security" {
  source = "../../modules/security"

  vpc_id              = module.networking.vpc_id
# This is module-to-module communication.
# Networking module exports VPC ID.
# Security module consumes it.
# This is proper Terraform modular design.
  ssh_allowed_cidr    = var.ssh_allowed_cidr
  environment         = var.environment
}
