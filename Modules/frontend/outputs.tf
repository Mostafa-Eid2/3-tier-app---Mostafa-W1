# Output for ALB DNS Name
output "frontend_alb_dns_name" {
  description = "The DNS name of the frontend Application Load Balancer"
  value       = aws_lb.frontend.dns_name
}

# Output for ALB ARN
output "frontend_alb_arn" {
  description = "The ARN of the frontend Application Load Balancer"
  value       = aws_lb.frontend.arn
}

# Output for ALB Target Group ARN
output "frontend_target_group_arn" {
  description = "The ARN of the frontend target group"
  value       = aws_lb_target_group.frontend.arn
}

# Output for Auto Scaling Group Name
output "frontend_asg_name" {
  description = "The name of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend.name
}

# Output for Launch Template ID
output "frontend_launch_template_id" {
  description = "The ID of the launch template for the frontend instances"
  value       = aws_launch_template.frontend.id
}

# Output for Frontend Security Group ID
output "frontend_security_group_id" {
  description = "The ID of the security group for frontend instances"
  value       = var.security_group_id
}


