variable "db_instance_type" {
  description = "The instance type for the database"
  type        = string
}

variable "allocated_storage" {
  description = "The storage size for the database in GB"
  type        = number
}

variable "multi_az" {
  description = "Enable Multi-AZ for the database"
  type        = bool
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
}

variable "subnet_ids" {
  description = "The private subnet IDs for the database"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the database"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the database resources"
  type        = map(string)
}
