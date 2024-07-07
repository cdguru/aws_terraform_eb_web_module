# Example of use for the AWS ElasticBeanstalk Pipeline module

```hcl
module "pipeline" {
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-pipeline?ref=v1.0"

  name = "MyWebAPP-prod"

  elasticbeanstalk_app_name = module.app.name
  elasticbeanstalk_env_name = module.environment.name

  full_repository_id  = "cdguru/simple-static-site"
  repository_branch   = "master"

  tags = {
    Name = "MyWebAPP"
    env  = "prod"
  }
}
```