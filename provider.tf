terraform {
  required_version = ">= 0.12.1"
}

provider "aws" {
  version = "~> 2.50"
  region  = var.aws_region
}

provider "kubernetes" {
  version          = "~> 1.11"
  load_config_file = false
}
