# AWS Configuration
aws_region = "us-east-1"
environment = "dev"
project_name = "reto-ecs-tmp0123"

# Networking
vpc_cidr = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# ECR
ecr_repository_name = "service-crud-api"
container_image_tag = "latest"

# ECS Task Configuration
task_cpu = 256
task_memory = 512
container_port = 8080
desired_count = 1

# Container Environment Variables
container_environment_variables = [
  {
    name  = "SPRING_PROFILES_ACTIVE"
    value = "dev"
  },
  {
    name  = "LOG_LEVEL"
    value = "DEBUG"
  }
]

# Auto Scaling
enable_auto_scaling = true
min_capacity = 1
max_capacity = 3
cpu_target_value = 70
memory_target_value = 70

# Health Check
health_check_path = "/actuator/health"

# Logging
log_retention_days = 7

# Tags
additional_tags = {
  CostCenter = "engineering"
  Team       = "platform"
}