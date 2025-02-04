output "db_instance_endpoint" {
  description = "The endpoint of the RDS database"
  value       = aws_db_instance.database.endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS database instance"
  value       = aws_db_instance.database.id
}
