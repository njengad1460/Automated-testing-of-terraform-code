# Security group for EC2 instances

resource "aws_security_group" "ec2_sg" {
    name = "${var.environment}-ec2-sg"
    description = "Security group for EC2 instances in ${var.environment} environment"
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.environment}-ec2-sg"
        Environment = var.environment
    }
}

# Ingress rule to allow SSH access from specified CIDR block
resource "aws_security_group_rule" "ssh_ingress" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
    security_group_id = aws_security_group.ec2_sg.id
}

# Egress rule to allow all outbound traffic
resource "aws_security_group_rule" "egress_all" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.ec2_sg.id
    depends_on = [aws_security_group.ec2_sg]
}

