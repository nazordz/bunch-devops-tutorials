locals {
  private_route53_zone = "antonputra.pvt"
  private_ingress      = "ab7b5bf884b0143dca27aab163ed842f-83cd3df3721690b6.elb.us-east-1.amazonaws.com"
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
