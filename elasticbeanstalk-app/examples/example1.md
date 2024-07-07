# Example of use for the AWS ElasticBeanstalk APP module

```hcl
module "app" {
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-env?ref=v1.0"

  name = "MyWebAPP"
  description = "A beautiful and unique website"

  tags = {
    Name = "MyWebAPP"
    env  = "prod"
  }
}
```