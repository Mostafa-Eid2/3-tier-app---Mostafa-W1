# VPC Outputs
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

# Security Groups Outputs
output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = module.security_groups.alb_security_group_id
}

output "frontend_security_group_id" {
  description = "The ID of the frontend security group"
  value       = module.security_groups.frontend_security_group_id
}

output "backend_security_group_id" {
  description = "The ID of the backend security group"
  value       = module.security_groups.backend_security_group_id
}

output "database_security_group_id" {
  description = "The ID of the database security group"
  value       = module.security_groups.database_security_group_id
}

output "bastion_security_group_id" {
  description = "The ID of the security group for the bastion host"
  value       = module.security_groups.bastion_security_group_id
}

# Frontend Outputs
output "frontend_alb_dns_name" {
  description = "The DNS name of the frontend Application Load Balancer"
  value       = module.frontend.frontend_alb_dns_name
}

output "frontend_asg_name" {
  description = "The name of the frontend Auto Scaling Group"
  value       = module.frontend.frontend_asg_name
}

output "frontend_target_group_arn" {
  description = "The ARN of the frontend target group"
  value       = module.frontend.frontend_target_group_arn
}

# Backend Outputs
output "backend_asg_name" {
  description = "The name of the backend Auto Scaling Group"
  value       = module.backend.backend_asg_name
}

# Database Outputs
output "db_instance_endpoint" {
  description = "The endpoint of the RDS database instance"
  value       = module.database.db_instance_endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS database instance"
  value       = module.database.db_instance_id
}

# Public Components Outputs
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.public_components.nat_gateway_id
}

output "bastion_host_id" {
  description = "The ID of the Bastion Host"
  value       = module.public_components.bastion_host_id
}

output "bastion_host_public_ip" {
  description = "The public IP address of the Bastion Host"
  value       = module.public_components.bastion_host_public_ip
}

# Key Outputs
output "key_name" {
  description = "The name of the generated SSH key pair"
  value       = module.key.key_name
}

output "private_key_path" {
  description = "The path to the private key file"
  value       = module.key.private_key_path
}

output "public_key" {
  description = "The public key content"
  value       = module.key.public_key
}
