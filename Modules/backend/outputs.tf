output "backend_asg_name" {
  description = "The name of the backend Auto Scaling Group"
  value       = aws_autoscaling_group.backend.name
}

output "backend_instance_ids" {
  description = "List of backend instance IDs"
  value       = aws_autoscaling_group.backend.id
}
