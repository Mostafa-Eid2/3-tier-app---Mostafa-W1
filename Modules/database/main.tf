# RDS Subnet Group
resource "aws_db_subnet_group" "database" {
  name       = "database-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "Database-Subnet-Group"
    }
  )
}

# RDS Instance
resource "aws_db_instance" "database" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.db_instance_type
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  multi_az             = var.multi_az
  db_subnet_group_name = aws_db_subnet_group.database.name
  vpc_security_group_ids = [var.security_group_id]

  publicly_accessible = false

  tags = merge(
    var.tags,
    {
      Name = "RDS-Database"
    }
  )
}
