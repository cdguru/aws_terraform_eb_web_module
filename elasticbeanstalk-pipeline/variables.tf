variable "name" {
  type = string
  description = "The name of our pipeline"
}
variable "elasticbeanstalk_app_name" {
  type = string
  description = "The name of our Application"
}
variable "elasticbeanstalk_env_name" {
  type = string
  default = "The name of our environment"
}
variable "full_repository_id" {
  type = string
  description = "The full repo id. Format: <org-name>/<repo-name>"
}
variable "repository_branch" {
  type = string
  description = "The branch where our code will be"
}
variable "codestarconnection_arn" {
  type = string
  description = "The arn of the aws_codestarconnections_connection resource. This is to connect the pipeline to Git !"
}
variable "tags" {
  type = map(string)
  description = "Tags for our resources"
}