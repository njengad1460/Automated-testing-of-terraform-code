variable "vpc_cidr" {
  description = "VPC cidr block"
  type       = string
}

variable "public_subnet_cidr" {
  description = "Public subnet cidr block"
  type       = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
variable "environment" {
  description = "Environment name"
  type        = string
}