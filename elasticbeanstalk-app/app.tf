resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = var.name
  description = var.description

  appversion_lifecycle {
    service_role          = aws_iam_role.role.arn
    max_count             = var.max_count
    delete_source_from_s3 = var.delete_source_from_s3
  }
  tags = var.tags
}