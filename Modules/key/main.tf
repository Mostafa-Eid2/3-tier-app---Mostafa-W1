# Generate SSH Key Pair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair using the generated public key
resource "aws_key_pair" "generated_key" {
  key_name   = "my_ssh_key"
  public_key = tls_private_key.rsa.public_key_openssh

}

# Save Private Key Locally
resource "local_file" "private_key" {
  filename = "${path.module}/private_key.pem"
  content  = tls_private_key.rsa.private_key_pem
}
