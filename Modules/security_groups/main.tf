# Security Group for ALB (Application Load Balancer)
resource "aws_security_group" "alb" {
  name   = "alb-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow HTTP traffic from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "ALB-SG"
    }
  )
}

# Security Group for Frontend Instances
resource "aws_security_group" "frontend" {
  name   = "frontend-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "Allow traffic from ALB and CloudFront"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
    cidr_blocks     = var.cloudfront_allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Frontend-SG"
    }
  )
}

# Security Group for Backend Instances
resource "aws_security_group" "backend" {
  name   = "backend-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "Allow traffic from Frontend instances"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Backend-SG"
    }
  )
}

# Security Group for Database
resource "aws_security_group" "database" {
  name   = "database-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "Allow traffic from Backend instances"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Database-SG"
    }
  )
}

# Security Group for Bastion Host
resource "aws_security_group" "bastion" {
  name   = "bastion-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH traffic from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "Bastion-SG"
    }
  )
}

# Security Group for CloudFront Origin
resource "aws_security_group" "cloudfront" {
  name   = "cloudfront-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow HTTP traffic from CloudFront"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cloudfront_allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "CloudFront-SG"
    }
  )
}
