# AWS Region
variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

# VPC Configuration
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# Project Metadata
variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

# Frontend Configuration
variable "frontend_instance_count" {
  description = "The desired number of frontend instances"
  type        = number
}

variable "frontend_instance_type" {
  description = "The instance type for frontend instances"
  type        = string
}

# Backend Configuration
variable "backend_instance_count" {
  description = "The desired number of backend instances"
  type        = number
}

variable "backend_instance_type" {
  description = "The instance type for backend instances"
  type        = string
}

# Database Configuration
variable "db_instance_type" {
  description = "The instance type for the RDS database"
  type        = string
}

variable "db_allocated_storage" {
  description = "The storage size for the database in GB"
  type        = number
}

variable "db_multi_az" {
  description = "Enable Multi-AZ for the database"
  type        = bool
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The master username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The master password for the RDS database"
  type        = string
  sensitive   = true
}

# AWS CloudFront Configuration
variable "cloudfront_allowed_ips" {
  description = "List of IP ranges allowed from CloudFront to ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Can be restricted later
}

variable "cloudfront_price_class" {
  description = "CloudFront price class (e.g., PriceClass_100, PriceClass_200, PriceClass_All)"
  type        = string
  default     = "PriceClass_100"
}

variable "cloudfront_default_ttl" {
  description = "Default TTL for CloudFront cache (seconds)"
  type        = number
  default     = 86400
}

variable "cloudfront_max_ttl" {
  description = "Maximum TTL for CloudFront cache (seconds)"
  type        = number
  default     = 31536000
}

# Tags
variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
}

variable "bastion_instance_type" {
  description = "The instance type for the bastion host"
  type        = string
}

variable "frontend_health_check_interval" {
  description = "The interval for frontend health checks"
  type        = number
}

variable "frontend_autoscaling_min_size" {
  description = "The minimum size of the frontend Auto Scaling Group"
  type        = number
}

variable "frontend_autoscaling_max_size" {
  description = "The maximum size of the frontend Auto Scaling Group"
  type        = number
}

variable "frontend_autoscaling_desired_capacity" {
  description = "The desired capacity of the frontend Auto Scaling Group"
  type        = number
}

variable "frontend_unhealthy_threshold" {
  description = "The threshold for marking an unhealthy frontend instance"
  type        = number
}

variable "db_encryption" {
  description = "Enable or disable database storage encryption"
  type        = bool
}

variable "bastion_security_group_ingress" {
  description = "Security group rules for the Bastion Host"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "frontend_healthy_threshold" {
  description = "Healthy threshold for frontend ALB health check"
  type        = number
}

variable "db_backup_retention"{
  description = "value of DB backup retention"
  type=number
}

variable "frontend_health_check_path"{
  description="value of frontend_health_check_path"
  type = string
}

variable "frontend_health_check_protocol"{
  description="value of frontend_health_check_protocol"
  type = string
}

variable "backend_autoscaling_desired_capacity" {
  description = "backend_autoscaling_desired_capacity"
  type = number
}

variable "db_performance_insights" {
  description = "db_performance_insights"
  type = bool
}

variable "backend_autoscaling_min_size" {
  description = "backend_autoscaling_min_size"
  type = number
}

variable "backend_autoscaling_max_size" {
  description = "backend_autoscaling_max_size"
  type = number
}

variable "frontend_health_check_timeout" {
  description = "frontend_health_check_timeout"
  type = number
}

variable "bastion_key_name" {
  description = "bastion_key_name"
  type = string
}

variable "db_port" {
  description = "db_port"
  type = number
}
