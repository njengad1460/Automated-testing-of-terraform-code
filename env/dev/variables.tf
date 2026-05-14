variable "vpc_cidr" {
  description = "VPC cidr block"
}
variable "public_subnet_cidr" {
  description = "Public cidr block"
}
variable "availability_zones" {
  description = "subnet availability zone"
}
variable "environment" {
  description = "deployment environment"
}
variable "ssh_allowed_cidr" {
  description = "cidr block allowed for ssh"
}