# Example of use for the AWS ElasticBeanstalk Environment module

```hcl
module "environment" {
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-env?ref=v1.0"

  name = "MyWebApp-prod"
  app_name = module.app.name
  description = "A very nice Production Environment"

  solution_stack_name = "64bit Amazon Linux 2023 v4.2.0 running PHP 8.2"
  ec2_key_name = "prod_key"

  ec2_enable_spot = false
  ec2_instance_types = "t3.small"

  asg_min_size = 2
  asg_max_size = 2

  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets
  elb_subnet_id = module.vpc.public_subnets

  tags = {
    Name = "MyWebAPP"
    env  = "prod"
  }
}
```