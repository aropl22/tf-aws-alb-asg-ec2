resource "aws_lb" "alb1" {
  name               = "alb1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb1.id]
  subnets            = var.subnets

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.s3-logs.id
    prefix  = "alb1"
    enabled = true
  }

   tags = merge(
    var.default_tags,
    {
      "name" = "alb1"
      "domain" = var.domain_name
    }
  )
}