variable "vpc_id" {
  description = "vpc Id ro apply security"
  type        = string
}

variable "environment" {
  description = "environment on where to apply the security groups"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "cidr block allowed to ssh"
  type        = string
}