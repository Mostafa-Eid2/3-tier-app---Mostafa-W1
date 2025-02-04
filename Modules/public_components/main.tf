# NAT Gateway Elastic IP
resource "aws_eip" "nat" {
  vpc = true

  tags = merge(
    var.tags,
    {
      Name = "NAT-Gateway-EIP"
    }
  )
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(var.public_subnet_ids, 0)

  tags = merge(
    var.tags,
    {
      Name = "NAT-Gateway"
    }
  )
}

# Route Table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "Private-Route-Table"
    }
  )
}

# Route for NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = element(var.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private.id
}

# Bastion Host
resource "aws_instance" "bastion" {
  ami           = "ami-12345678" # Replace with a valid AMI ID
  instance_type = "t3.micro"
  key_name      = var.key_name
  subnet_id     = element(var.public_subnet_ids, 0)
  vpc_security_group_ids = [var.bastion_security_group_id]

  tags = merge(
    var.tags,
    {
      Name = "Bastion-Host"
    }
  )
}
