variable "environment" {
  description = "Environment name"
  type        = string
}

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "max_image_count" {
  description = "Maximum number of images to retain"
  type        = number
  default     = 10
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}