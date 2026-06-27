resource "aws_cloudfront_distribution" "resume_distribution" {
  enabled             = true
  default_root_object = "index.html"
  aliases             = ["paul-giff.com", "www.paul-giff.com"]

  origin {
    domain_name              = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
    origin_id                = "S3-paul-gifford-resume"
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_oac.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-paul-gifford-resume"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:357644039654:certificate/0a29fc13-129f-480b-97c8-6aa331364013"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

resource "aws_cloudfront_origin_access_control" "resume_oac" {
  name                              = "resume-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}