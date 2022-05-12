terraform {
  required_providers {
    aws = {
      verversion = "~> 3.44.0"
    }
  }
  required_version = ">=0.15.5"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "compute" {
  source         = "./modules/compute"
  subnets        = module.vpc.public_subnets
  security_group = module.vpc.public_sg
  subnet_ips     = module.vpc.subnets_ips
}
