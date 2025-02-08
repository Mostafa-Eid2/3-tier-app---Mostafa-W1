# Terraform Initialization
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0"
}

# AWS Provider Configuration
provider "aws" {
  region  = var.aws_region
  profile = "DevOps-Intern-mostafa"
}

# VPC Module
module "vpc" {
  source          = "./Modules/vpc"
  cidr_block      = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Security Groups Module
module "security_groups" {
  source = "./Modules/security_groups"

  vpc_id = module.vpc.vpc_id
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
# Key Module
module "key" {
  source   = "./Modules/key"
}
# Frontend Module
module "frontend" {
  source                       = "./Modules/frontend"
  instance_count               = var.frontend_instance_count
  instance_type                = var.frontend_instance_type
  subnet_ids                   = module.vpc.public_subnet_ids
  public_subnets               = var.public_subnets
  security_group_id            = module.security_groups.frontend_security_group_id
  vpc_id                       = module.vpc.vpc_id
  key_name                     = module.key.key_name
  autoscaling_min_size         = var.frontend_autoscaling_min_size
  autoscaling_max_size         = var.frontend_autoscaling_max_size
  autoscaling_desired_capacity = var.frontend_autoscaling_desired_capacity
  ami_id                       = data.aws_ami.ubuntu.id
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Backend Module
module "backend" {
  source            = "./Modules/backend"
  instance_count    = var.backend_instance_count
  instance_type     = var.backend_instance_type
  ami_id            = data.aws_ami.ubuntu.id
  subnet_ids        = module.vpc.private_subnet_ids
  security_group_id = module.security_groups.backend_security_group_id
  target_group_arn  = module.frontend.frontend_target_group_arn
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Database Module
module "database" {
  source            = "./Modules/database"
  db_instance_type  = var.db_instance_type
  allocated_storage = var.db_allocated_storage
  multi_az          = var.db_multi_az
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  subnet_ids        = module.vpc.private_subnet_ids
  security_group_id = module.security_groups.database_security_group_id
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Public Components Module
module "public_components" {
  source                    = "./Modules/public_components"
  vpc_id                    = module.vpc.vpc_id
  public_subnet_ids         = module.vpc.public_subnet_ids
  private_subnet_ids        = module.vpc.private_subnet_ids
  key_name                  = module.key.key_name
  bastion_security_group_id = module.security_groups.bastion_security_group_id
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}


