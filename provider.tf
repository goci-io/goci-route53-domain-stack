terraform {
  required_version = ">= 0.12.1"

  required_providers {
    kubernetes = "~> 1.11"
  }
}

provider "aws" {
  version = "~> 2.50"
  region  = var.aws_region
}
