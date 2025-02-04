output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "bastion_host_id" {
  description = "The ID of the Bastion Host"
  value       = aws_instance.bastion.id
}

output "bastion_host_public_ip" {
  description = "The public IP address of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}
