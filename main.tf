provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "0.12.30"
  backend "s3" {
    encrypt = "true"
    bucket  = "tf-remote-state-corpit-acct"
    key     = "corp-it/okta_radius/terraform.tfstate"
  }
}

module "ec2_cluster" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "radius-agent"
  instance_count = var.instance_count

  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = true
  vpc_security_group_ids      = var.security_group_ids
  subnet_ids                  = var.subnet_ids

  tags = {
    Terraform   = "true"
    Environment = "corp-it"
  }
}
