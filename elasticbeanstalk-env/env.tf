resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = var.name
  application         = var.app_name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",",var.subnet_id)
  } 
  
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = join(",",var.elb_subnet_id)
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "EnableSpot"
    value     = var.ec2_enable_spot
  }

   setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.ec2_instance_types
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.i_profile.name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.ec2_key_name
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.asg_min_size
  }  

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.asg_max_size
  }  

  tags = var.tags

  depends_on = [ aws_iam_role.role ]
}