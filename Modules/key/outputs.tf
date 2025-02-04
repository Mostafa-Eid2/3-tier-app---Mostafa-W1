output "key_name" {
  description = "The name of the generated SSH key pair"
  value       = aws_key_pair.generated_key.key_name
}

output "private_key_path" {
  description = "The path to the private key file"
  value       = local_file.private_key.filename
}

output "public_key" {
  description = "The public key content"
  value       = tls_private_key.rsa.public_key_openssh
}
