# Variables generales
variable "aws_region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags para todos los recursos"
  type        = map(string)
  default     = {}
}

# Variables de Networking
variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDR blocks para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Lista de availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Variables de Load Balancer (NLB)
variable "listener_port" {
  description = "Puerto del listener TCP"
  type        = number
  default     = 80
}

variable "health_check_interval" {
  description = "Intervalo de health check en segundos"
  type        = number
  default     = 30
}

variable "health_check_healthy_threshold" {
  description = "Umbral saludable"
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "Umbral no saludable"
  type        = number
  default     = 3
}

variable "enable_deletion_protection" {
  description = "Habilitar protección contra eliminación del NLB"
  type        = bool
  default     = false
}

variable "enable_tls" {
  description = "Habilitar listener TLS en puerto 443"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "ARN del certificado ACM para TLS"
  type        = string
  default     = null
}

# Variables de ECS
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
  default     = 8080
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