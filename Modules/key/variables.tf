variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the key pair resource"
  type        = map(string)
}
