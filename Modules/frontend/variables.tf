# Instance Configuration
variable "instance_count" {
  description = "The desired number of frontend instances"
  type        = number
}

variable "instance_type" {
  description = "The instance type for frontend instances"
  type        = string
}

variable "ami_id" {
  description = "The ID Of The AMI"
  type        = string
}


# Auto Scaling Configuration
variable "autoscaling_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
}

variable "autoscaling_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
}

variable "autoscaling_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}

# Network Configuration
variable "subnet_ids" {
  description = "List of subnet IDs where frontend instances will be deployed"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for frontend instances"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the frontend target group is created"
  type        = string
}

# Health Check Configuration
variable "health_check_interval" {
  description = "The interval (in seconds) between each health check"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The path used for health check requests"
  type        = string
  default     = "/"
}

variable "health_check_protocol" {
  description = "The protocol used for health check requests"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The timeout (in seconds) for each health check"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "The number of consecutive successful health checks before an instance is considered healthy"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "The number of consecutive failed health checks before an instance is considered unhealthy"
  type        = number
  default     = 3
}

# Tags
variable "tags" {
  description = "Tags to apply to frontend resources"
  type        = map(string)
}

# Key Pair Configuration
variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}
