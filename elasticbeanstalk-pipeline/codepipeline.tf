resource "aws_codepipeline" "codepipeline" {
  name            = var.name 
  role_arn        = aws_iam_role.codepipeline_role.arn
  pipeline_type   = "V2"
  execution_mode  = "QUEUED"

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"

  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codestarconnection_arn
        FullRepositoryId = var.full_repository_id
        BranchName       = var.repository_branch
      }
    }   
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ElasticBeanstalk"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ApplicationName = var.elasticbeanstalk_app_name
        EnvironmentName = var.elasticbeanstalk_env_name
      }
    }
  }
  
  tags = var.tags
}