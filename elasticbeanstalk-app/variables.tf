variable "name" {
  type = string
  description = "Application Name"
}
variable "description" {
  type = string
  description = "Brief description about the app"
}
variable "max_count" {
  type = number
  description = "Number of version for this app to keep"
  default = 5
}
variable "delete_source_from_s3" {
  type = bool
  description = "Set to true to delete a version's source bundle from S3 when the application version is deleted."
  default = true
}
variable "tags" {
  type = map(string)
  description = "Tags for our resources"
}