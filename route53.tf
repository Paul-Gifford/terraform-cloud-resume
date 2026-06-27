data "aws_route53_zone" "paul_giff" {
  zone_id = "Z06056292TELKX9NLOZUM"
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.paul_giff.zone_id
  name    = "paul-giff.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.paul_giff.zone_id
  name    = "www.paul-giff.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.resume_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.resume_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}