output "alb_security_group_id" {
  description = "The ID of the ALB Security Group"
  value       = aws_security_group.alb.id
}

output "frontend_security_group_id" {
  description = "The ID of the Frontend Security Group"
  value       = aws_security_group.frontend.id
}

output "backend_security_group_id" {
  description = "The ID of the Backend Security Group"
  value       = aws_security_group.backend.id
}

output "database_security_group_id" {
  description = "The ID of the Database Security Group"
  value       = aws_security_group.database.id
}

output "bastion_security_group_id" {
  description = "The ID of the security group for the bastion host"
  value       = aws_security_group.bastion.id
}

output "cloudfront_security_group_id" {
  description = "The ID of the security group for CloudFront origin"
  value       = aws_security_group.cloudfront.id
}
