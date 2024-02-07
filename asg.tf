resource "aws_launch_template" "template1" {
  name_prefix   = "alb1_template"
  image_id      = data.aws_ami.amazonlinux3.id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}