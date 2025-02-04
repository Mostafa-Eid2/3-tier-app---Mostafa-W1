# Generate SSH Key Pair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair using the generated public key
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh

  tags = merge(
    var.tags,
    {
      Name = "Key-Pair-${var.key_name}"
    }
  )
}

# Save Private Key Locally
resource "local_file" "private_key" {
  filename = "${path.module}/private_key.pem"
  content  = tls_private_key.rsa.private_key_pem
}
