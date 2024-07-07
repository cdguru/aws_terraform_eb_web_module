resource "aws_iam_role" "role" {
  name                = "${var.app_name}_role"
  managed_policy_arns = [
    data.aws_iam_policy.AWSElasticBeanstalkMulticontainerDocker.arn,
    data.aws_iam_policy.AWSElasticBeanstalkRoleCWL.arn,
    data.aws_iam_policy.AWSElasticBeanstalkWorkerTier.arn,
    data.aws_iam_policy.AWSElasticBeanstalkWebTier.arn
  ]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tags

}

data "aws_iam_policy" "AWSElasticBeanstalkMulticontainerDocker" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}
data "aws_iam_policy" "AWSElasticBeanstalkWorkerTier" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}
data "aws_iam_policy" "AWSElasticBeanstalkRoleCWL" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkRoleCWL"
}
data "aws_iam_policy" "AWSElasticBeanstalkWebTier" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_instance_profile" "i_profile" {
  name = "${var.app_name}"
  role = aws_iam_role.role.name

  tags = var.tags
}