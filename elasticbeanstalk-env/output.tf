output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}
output "name" {
  value = aws_elastic_beanstalk_environment.eb_env.name
}
output "endpoint_url" {
  value = aws_elastic_beanstalk_environment.eb_env.endpoint_url
}