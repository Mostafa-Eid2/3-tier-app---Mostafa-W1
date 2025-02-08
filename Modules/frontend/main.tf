# Launch Template for ASG
resource "aws_launch_template" "frontend" {
  name          = "frontend-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name  # <-- Use the declared variable

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name = "Frontend-Instance"
      }
    )
  }
}


# Auto Scaling Group
resource "aws_autoscaling_group" "frontend" {
  desired_capacity    = var.autoscaling_desired_capacity
  max_size            = var.autoscaling_max_size
  min_size            = var.autoscaling_min_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.frontend.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.frontend.arn]

  tag {
    key                 = "Name"
    value               = "Frontend-ASG"
    propagate_at_launch = true
  }
}

# ALB for Frontend
resource "aws_lb" "frontend" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  # subnets = [var.subnet_ids[0], var.subnet_ids[1]]
  subnets            = [module.vpc.public_subnet_ids]  # <-- Use the declared variable
  enable_deletion_protection = false

  tags = merge(
    var.tags,
    {
      Name = "Frontend-ALB"
    }
  )
}

# ALB Target Group
resource "aws_lb_target_group" "frontend" {
  name        = "frontend-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    interval            = var.health_check_interval
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }

  tags = merge(
    var.tags,
    {
      Name = "Frontend-TG"
    }
  )
}

# ALB Listener
resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}
