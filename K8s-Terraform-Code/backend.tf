provider "aws" {
  version = "~> 3.41.0"
  region  = var.region
}

terraform {
  backend "s3" {
  }
}