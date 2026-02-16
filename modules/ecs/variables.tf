variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "aws_region" {
  description = "Región de AWS"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  type        = list(string)
}

variable "ecs_tasks_security_group_id" {
  description = "ID del security group para ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ARN del target group"
  type        = string
}

variable "container_name" {
  description = "Nombre del contenedor"
  type        = string
  default     = "app"
}

variable "container_image" {
  description = "Imagen del contenedor"
  type        = string
}

variable "container_port" {
  description = "Puerto del contenedor"
  type        = number
}

variable "container_environment" {
  description = "Variables de entorno para el contenedor"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "task_cpu" {
  description = "CPU para la tarea Fargate"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memoria para la tarea Fargate"
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Número deseado de tareas"
  type        = number
  default     = 2
}

variable "enable_container_insights" {
  description = "Habilitar Container Insights"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "Días de retención de logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags para los recursos"
  type        = map(string)
  default     = {}
}