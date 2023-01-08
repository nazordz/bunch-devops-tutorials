locals {
  public_route53_zone = "antonputra.com"
  public_ingress      = "ae2d319782afc46169467cae1b8ba7d5-f967f6a708796a0d.elb.us-east-1.amazonaws.com"
}

data "aws_route53_zone" "public" {
  name         = local.public_route53_zone
  private_zone = false
}

resource "aws_route53_record" "grafana" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "grafana"
  type    = "CNAME"
  ttl     = 300
  records = [local.public_ingress]
}

# Do NOT expose Prometheus to Internet (demo only)
resource "aws_route53_record" "prometheus" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "prometheus"
  type    = "CNAME"
  ttl     = 300
  records = [local.public_ingress]
}

# Do NOT expose Linerd Dashboard to Internet (demo only)
resource "aws_route53_record" "linerd" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "linerd"
  type    = "CNAME"
  ttl     = 300
  records = [local.public_ingress]
}
