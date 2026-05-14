# Automated Testing of Terraform Code

A modular Terraform project that provisions a public EC2 web server on AWS, with automated testing using both native Terraform tests and Terratest (Go).

## Architecture

The project is split into reusable modules consumed by environment-specific configurations:

```
modules/
  networking/   - VPC, public subnet, internet gateway, route table
  security/     - EC2 security group (SSH ingress, all egress)
  compute/      - EC2 instance with public IP
env/
  dev/          - Development environment
  staging/      - Staging environment
test/           - Terratest integration tests (Go)
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.6
- [Go](https://go.dev/dl/) >= 1.21 (for Terratest integration tests)
- AWS credentials configured (`aws configure` or environment variables)
- An existing EC2 key pair in the target region

## Configuration

Update `env/dev/terraform.tfvars` with your values:

| Variable             | Description                        | Default                    |
|----------------------|------------------------------------|----------------------------|
| `vpc_cidr`           | VPC CIDR block                     | `10.0.0.0/16`              |
| `public_subnet_cidr` | Public subnet CIDR                 | `10.0.1.0/24`              |
| `availability_zones` | List of AZs                        | `["af-south-1a", ...]`     |
| `environment`        | Deployment environment label       | `dev`                      |
| `ssh_allowed_cidr`   | CIDR allowed for SSH access        | `0.0.0.0/0`                |
| `ami_id`             | EC2 AMI ID                         | Amazon Linux 2 (af-south-1)|
| `instance_type`      | EC2 instance type                  | `t4g.nano`                 |
| `key_name`           | Existing EC2 key pair name         | `test-ec2-key-pair`        |

The remote state is stored in S3. Update `env/dev/backend.tf` with your bucket name before initialising.

## Usage

```bash
cd env/dev
terraform init
terraform plan
terraform apply
```

## Testing

### Native Terraform Tests (unit/plan-level)

Runs against the `compute` module using `terraform test`. No real AWS resources are created.

```bash
cd modules/compute
terraform init
terraform test
```

Tests validate:
- Instance type is `t4g.nano`
- Public IP association is enabled
- Correct key pair is configured

### Terratest Integration Tests (Go)

Deploys the full `dev` environment, asserts a public IP is returned, then destroys all resources.

```bash
cd test
go mod download
go test -v -timeout 30m
```

> **Note:** This creates real AWS resources and will incur costs. Ensure your AWS credentials have sufficient permissions.

## Remote State

State is stored in S3 with native S3 locking (`use_lockfile = true`) and encryption enabled. Configure the backend in `env/dev/backend.tf` before first use.
