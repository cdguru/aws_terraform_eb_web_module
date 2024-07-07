variable "name" {
  type = string
  description = "Environment Name"
}
variable "app_name" {
  type = string
  description = "Application Name"
}
variable "description" {
  type = string
  description = "Brief description about the app"
}
variable "solution_stack_name" {
  type = string
  description = "The full name of the solution stack"
}
variable "ec2_instance_types" {
  type = string
  description = "IMPORTANT: Comma separated string of ec2 instances to use. Example: t3.large,m5.large"
}
variable "ec2_key_name" {
  type = string
  description = "Name of the key to use in case we need to access the EC2 used in our environemnt"
}
variable "vpc_id" {
  type = string
  description = "The ID of the VPC we want to use"
}
variable "subnet_id" {
  type = list(string)
  description = "List of subnet for the EC2 to use (Private subnets in the 99% of the times)"
}
variable "elb_subnet_id" {
  type = list(string)
  description = "List of subnet for the Load Balancer to use (Public if you want your web accessible from internet)"
}
variable "ec2_enable_spot" {
  type = bool
  default = false
  description = "Do you want to use SPOT instances? (Good for test and dev environment)"
}
variable "asg_min_size" {
  type = number
  description = "Minimum amount of EC2 to use to host your website"
}
variable "asg_max_size" {
  type = number
  description = "Maximum amount of EC2 to use to host your website"
}
variable "tags" {
  type = map(string)
  description = "Tags for our resources"
}