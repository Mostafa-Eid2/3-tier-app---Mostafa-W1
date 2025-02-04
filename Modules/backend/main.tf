# Launch Configuration for ASG
resource "aws_launch_template" "backend" {
  name          = "backend-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = "my-ssh-key" # Replace with your key name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = "Backend-Instance"
      }
    )
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "backend" {
  desired_capacity     = var.instance_count
  max_size             = var.instance_count + 1
  min_size             = var.instance_count
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.backend.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn] # الربط مع Target Group

  tag {
    key                 = "Name"
    value               = "Backend-ASG"
    propagate_at_launch = true
  }
}
