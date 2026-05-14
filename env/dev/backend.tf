terraform {
  backend "s3" {
    bucket = "davy-terraform-state-storage"
    key    = "public-ec2-terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-state-locking"
    use_lockfile = true
    encrypt      = true
  }
}