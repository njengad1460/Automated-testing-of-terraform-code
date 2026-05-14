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
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}
variable "instance_type" {
  description = "EC2 instance type"
}
variable "key_name" {
  description = "key pair name to be used for EC2 instance"
}