variable "instance_count" {
  description = "The desired number of backend instances"
  type        = number
}

variable "instance_type" {
  description = "The instance type for backend instances"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for backend instances"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where backend instances will be launched"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for backend instances"
  type        = string
}

variable "tags" {
  description = "Tags to assign to backend instances"
  type        = map(string)
}

variable "target_group_arn" {
  description = "The ARN of the target group for backend instances"
  type        = string
}
