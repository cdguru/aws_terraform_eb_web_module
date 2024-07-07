resource "aws_iam_role" "role" {
  name                = lower("project-1-cdguru-${var.name}-app")
  managed_policy_arns = [
    aws_iam_policy.policy_one.arn, 
    aws_iam_policy.policy_two.arn,
    data.aws_iam_policy.AWSElasticBeanstalkEnhancedHealth.arn,
    data.aws_iam_policy.AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy.arn
  ]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "elasticbeanstalk.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tags

}

data "aws_iam_policy" "AWSElasticBeanstalkEnhancedHealth" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}
data "aws_iam_policy" "AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
}

resource "aws_iam_policy" "policy_one" {
  name = lower("project-1-cdguru-${var.name}-app-p1")

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "policy_two" {
  name = lower("project-1-cdguru-${var.name}-app-p2")

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListAllMyBuckets", "s3:ListBucket", "s3:HeadBucket"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}