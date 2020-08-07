terraform {
  required_version = ">= 0.12.1"
}

provider "aws" {
  version = "~> 2.50"
  region  = var.aws_region
}
