output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
