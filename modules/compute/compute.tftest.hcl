variables {
  instance_type     = "t4g.nano"
  subnet_id         = "subnet-123456"
  security_group_id = "sg-123456"
  key_name          = "my-web-server-key-pair"
  environment       = "dev"
  ami_id            = "ami-04272eaccc7d3dfa8"
}

run "validate_instance_type" {
  command = plan

  assert {
    condition     = aws_instance.web_server.instance_type == "t4g.nano"
    error_message = "EC2 instance type must be t4g.nano"
  }
}

run "validate_public_ip" {
  command = plan

  assert {
    condition     = aws_instance.web_server.associate_public_ip_address == true
    error_message = "EC2 instance must have a public IP"
  }
}

run "validate_keypair" {
  command = plan

  assert {
    condition     = aws_instance.web_server.key_name == "my-web-server-key-pair"
    error_message = "Incorrect key pair configured"
  }
}