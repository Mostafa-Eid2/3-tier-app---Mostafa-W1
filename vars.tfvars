# AWS Region
aws_region = "us-east-1"

# VPC Configuration
vpc_cidr_block = "10.2.0.0/16"

# Public Subnets
public_subnets = [
  "10.2.1.0/24",  # Public Subnet AZ1
  "10.2.2.0/24"   # Public Subnet AZ2
]

# Private Subnets
private_subnets = [
  "10.2.3.0/24",  # Frontend AZ1
  "10.2.4.0/24",  # Frontend AZ2
  "10.2.5.0/24",  # Backend AZ1
  "10.2.6.0/24",  # Backend AZ2
  "10.2.7.0/24",  # Database AZ1
  "10.2.8.0/24"   # Database AZ2
]

# Project Metadata
environment  = "dev"
project_name = "3-tier-app"

# Frontend Configuration
frontend_instance_count               = 2
frontend_instance_type                = "t3.medium"
frontend_autoscaling_min_size         = 4
frontend_autoscaling_max_size         = 12
frontend_autoscaling_desired_capacity = 4
frontend_health_check_interval        = 30
frontend_health_check_path            = "/"
frontend_health_check_protocol        = "HTTP"
frontend_health_check_timeout         = 5
frontend_healthy_threshold            = 3
frontend_unhealthy_threshold          = 3

# Backend Configuration
backend_instance_count               = 2
backend_instance_type                = "t3.medium"
backend_autoscaling_min_size         = 2
backend_autoscaling_max_size         = 6
backend_autoscaling_desired_capacity = 2

# Database Configuration
db_instance_type        = "db.t3.medium"
db_allocated_storage    = 20
db_multi_az             = true
db_name                 = "mydatabase"
db_username             = "admin"
db_password             = "supersecurepassword" # Make sure this password is secure
db_port                 = 3306                  # Default MySQL port
db_backup_retention     = 7                     # Keep backups for 7 days
db_performance_insights = true                  # Enable Performance Insights
db_encryption           = true                  # Enable Storage Encryption

# Bastion Host Configuration
bastion_instance_type = "t3.medium"
bastion_key_name      = "my-ssh-key"
bastion_security_group_ingress = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Tags
tags = {
  Environment = "dev"
  Project     = "3-tier-app"
  Owner       = "mostafa.eid@intern.algocas.com"
  Application = "WebApp"
  CostCenter  = "12345"
}
