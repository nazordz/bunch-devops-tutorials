resource "aws_route53_zone" "antonputra" {
  name = "antonputra.pvt"

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

resource "aws_route53_record" "api_traefik" {
  zone_id = aws_route53_zone.antonputra.zone_id
  name    = "api-java"
  type    = "CNAME"
  ttl     = 300
  records = ["a96c81b49ac54470a8ce49ed8a716660-61ab307416025ad3.elb.us-east-1.amazonaws.com"]
}
