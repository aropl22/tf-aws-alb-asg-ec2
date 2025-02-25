module "dns" {
  source             = "./dns"
  domain_name        = var.domain_name
  record_domain_name = aws_lb.alb1.dns_name
  record_zone_id     = aws_lb.alb1.zone_id
  dns_tags = merge(
    var.default_tags,
    {
      "Name" = "${var.domain_name}"
    }
  )
}

module "certificate" {
  source = "./certificate"
  #region = "us-east-1"
  domain_name         = var.domain_name
  aws_route53_zone_id = module.dns.dns_hosted_zone_id
  cert_tags = merge(
    var.default_tags,
    {
      "Name" = "cloudfront cert ${var.domain_name}"
    }
  )
}
