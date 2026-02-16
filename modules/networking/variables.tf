variable "project_name" {
  description = "Nombre del proyecto"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDR blocks para subredes públicas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Tags para los recursos"
  type        = map(string)
  default     = {}
}