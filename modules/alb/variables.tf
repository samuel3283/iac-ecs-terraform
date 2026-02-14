variable "environment" {
  description = "Environment name"
  type        = string
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 8080
}

variable "health_check_path" {
  description = "Path for health checks"
  type        = string
  default     = "/actuator/health"
}

variable "certificate_arn" {
  description = "ARN of SSL certificate for HTTPS"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}