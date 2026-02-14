variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8080
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}