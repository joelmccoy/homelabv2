terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
  }
  required_version = "~> 1.9.0"

  backend "s3" {
    bucket         = "homelabv2-tf-state-20250402193806856500000001"
    key            = "aws/bootstrap/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "homelabv2-tf-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      tofu              = true
      github_repository = "joelmccoy/homelab2"
    }
  }
}
