resource "aws_security_group" "sg_alb1" {
  name        = "alb1-sg"
  description = "Attached to alb1"
  vpc_id      = var.vpc_id

  dynamic "ingress" {

    for_each = var.sgroup_alb1

    content {

      from_port   = ingress.value.port_from
      to_port     = ingress.value.port_to
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.remote_cidr_block]

    }
  }
  egress {
    # Allow all outgoing traffic
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

   tags = merge(
    var.default_tags,
    {
      "name" = "alb1"
    }
  )
}
