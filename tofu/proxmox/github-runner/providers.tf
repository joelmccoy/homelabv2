terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.74"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
  required_version = "~> 1.9.0"

  backend "s3" {
    bucket         = "homelabv2-tf-state-20250402193806856500000001"
    key            = "proxmox/githug-runner/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "homelabv2-tf-state-lock"
    encrypt        = true
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  insecure = true

  api_token = var.proxmox_api_token
  ssh {
    agent    = true
    username = var.proxmox.username
  }
}
