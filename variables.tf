# AWS Configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ecs-fargate-app"
}

# Networking
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

# ECR
variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "container_image_tag" {
  description = "Container image tag"
  type        = string
  default     = "latest"
}

# ECS Task
variable "task_cpu" {
  description = "CPU units for the task"
  type        = number
  default     = 512
}

variable "task_memory" {
  description = "Memory for the task"
  type        = number
  default     = 1024
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8080
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
  default     = 2
}

variable "container_environment_variables" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

# Auto Scaling
variable "enable_auto_scaling" {
  description = "Enable auto scaling"
  type        = bool
  default     = true
}

variable "min_capacity" {
  description = "Minimum number of tasks"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of tasks"
  type        = number
  default     = 10
}

variable "cpu_target_value" {
  description = "Target CPU utilization for auto scaling"
  type        = number
  default     = 70
}

variable "memory_target_value" {
  description = "Target memory utilization for auto scaling"
  type        = number
  default     = 70
}

# ALB
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

# Logging
variable "log_retention_days" {
  description = "Days to retain logs"
  type        = number
  default     = 30
}

# Tags
variable "additional_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}