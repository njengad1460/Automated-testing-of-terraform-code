resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id] # Attaches:SSH rules HTTP rules
  key_name        = var.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }
}
