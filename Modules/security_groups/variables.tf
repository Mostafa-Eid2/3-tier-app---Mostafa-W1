# VPC ID
variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created"
  type        = string
}

# Tags for all security groups
variable "tags" {
  description = "Tags to assign to security groups"
  type        = map(string)
}

# Allowed IP Ranges for CloudFront
variable "cloudfront_allowed_ips" {
  description = "List of IP ranges allowed from CloudFront to ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"] # يمكن تخصيصه لاحقًا إذا لزم الأمر
}

# WAF Rule - Blocked IPs
variable "waf_blocked_ips" {
  description = "List of IPs to block using AWS WAF"
  type        = list(string)
  default     = []
}

# WAF Rule - Allowed Countries (Geo Match)
variable "waf_allowed_countries" {
  description = "List of country codes allowed by WAF (ISO Alpha-2 format)"
  type        = list(string)
  default     = ["US", "CA", "UK"] # يمكن تعديلها حسب الحاجة
}

# WAF Rule - Rate Limit
variable "waf_rate_limit" {
  description = "The request rate limit per 5 minutes for WAF"
  type        = number
  default     = 2000
}
