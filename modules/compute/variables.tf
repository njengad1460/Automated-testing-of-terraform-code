variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "key_name" {
  description = "key pair name to be used"
  type        = string
}

variable "environment" {
  description = "environment for the ec2 deployment"
  type        = string
}
variable "ami_id" {
  description = "ami for the ec2 "
  type = string
}