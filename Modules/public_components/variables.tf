variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "key_name" {
  description = "The SSH key pair to use for Bastion Host"
  type        = string
}

variable "bastion_security_group_id" {
  description = "The security group ID for the Bastion Host"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the public components"
  type        = map(string)
}
