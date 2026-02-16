# Variables generales
aws_region   = "us-east-1"
project_name = "aws-reto"
environment  = "dev"

tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Project     = "aws-reto"
}

# Networking
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

# Load Balancer (NLB)
listener_port                    = 8080
health_check_interval            = 30
health_check_healthy_threshold   = 3
health_check_unhealthy_threshold = 3
enable_deletion_protection       = false
enable_tls                       = false
# certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxxx-xxxx-xxxx" # Descomentar si enable_tls = true

# ECS
container_name            = "app"
container_image           = "nginx:latest" # Cambiar por tu imagen
container_port            = 8080
task_cpu                  = "256"
task_memory               = "512"
desired_count             = 2
enable_container_insights = true
log_retention_days        = 7

# Variables de entorno para el contenedor
container_environment = [
  {
    name  = "ENVIRONMENT"
    value = "dev"
  },
  {
    name  = "PORT"
    value = "8080"
  }

]
