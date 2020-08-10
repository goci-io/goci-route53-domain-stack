terraform {
  required_version = ">= 0.12.1"

  required_providers {
    kubernetes = "~> 1.11"
  }
}

provider "aws" {
  version = "~> 2.50"
  region  = var.aws_region

  assume_role {
    role_arn     = var.aws_assume_role_arn
    external_id  = var.aws_sts_external_id
    session_name = "goci-provisioning"
  }
}
