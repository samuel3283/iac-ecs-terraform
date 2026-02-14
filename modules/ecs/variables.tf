variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Container image to deploy"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "container_environment" {
  description = "Environment variables for the container"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "task_cpu" {
  description = "CPU units for the task"
  type        = number
}

variable "task_memory" {
  description = "Memory for the task"
  type        = number
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
}

variable "assign_public_ip" {
  description = "Assign public IP to tasks"
  type        = bool
  default     = false
}

variable "enable_auto_scaling" {
  description = "Enable auto scaling"
  type        = bool
  default     = true
}

variable "min_capacity" {
  description = "Minimum number of tasks"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of tasks"
  type        = number
  default     = 5
}

variable "cpu_target_value" {
  description = "Target CPU utilization"
  type        = number
  default     = 70
}

variable "memory_target_value" {
  description = "Target memory utilization"
  type        = number
  default     = 70
}

variable "log_retention_days" {
  description = "Days to retain logs"
  type        = number
  default     = 30
}

variable "enable_execute_command" {
  description = "Enable execute command on ECS"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}