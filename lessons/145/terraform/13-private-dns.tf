locals {
  private_route53_zone = "antonputra.pvt"
  private_ingress      = "ae2d319782afc46169467cae1b8ba7d5-f967f6a708796a0d.elb.us-east-1.amazonaws.com"
}


resource "aws_route53_zone" "private" {
  name = local.private_route53_zone

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

resource "aws_route53_record" "java" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "java"
  type    = "CNAME"
  ttl     = 300
  records = [local.private_ingress]
}

resource "aws_route53_record" "go" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "go"
  type    = "CNAME"
  ttl     = 300
  records = [local.private_ingress]
}
