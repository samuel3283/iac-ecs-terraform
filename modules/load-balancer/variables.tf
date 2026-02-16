variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  type        = list(string)
}

variable "container_port" {
  description = "Puerto del contenedor"
  type        = number
}

variable "listener_port" {
  description = "Puerto del listener (TCP)"
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
  description = "Habilitar protección contra eliminación"
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

variable "tags" {
  description = "Tags para los recursos"
  type        = map(string)
  default     = {}
}