# Módulo de Networking
module "networking" {
  source = "./modules/networking"

  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  container_port      = var.container_port

  tags = var.additional_tags
}

# Módulo de ECR
module "ecr" {
  source = "./modules/ecr"

  environment     = var.environment
  repository_name = var.ecr_repository_name
  max_image_count = 10

  tags = var.additional_tags
}

# Módulo de ALB
module "alb" {
  source = "./modules/alb"

  environment       = var.environment
  name              = var.project_name
  vpc_id            = module.networking.vpc_id
  subnet_ids        = module.networking.public_subnet_ids
  security_group_id = module.networking.alb_security_group_id
  container_port    = var.container_port
  health_check_path = var.health_check_path
  certificate_arn   = var.certificate_arn

  tags = var.additional_tags
}

# Módulo de ECS
module "ecs" {
  source = "./modules/ecs"

  environment           = var.environment
  cluster_name          = "${var.project_name}-cluster"
  service_name          = "${var.project_name}-service"
  container_name        = "app"
  container_image       = "${module.ecr.repository_url}:${var.container_image_tag}"
  container_port        = var.container_port
  container_environment = var.container_environment_variables

  subnet_ids        = module.networking.public_subnet_ids
  security_group_id = module.networking.ecs_tasks_security_group_id
  target_group_arn  = module.alb.target_group_arn

  task_cpu         = var.task_cpu
  task_memory      = var.task_memory
  desired_count    = var.desired_count
  assign_public_ip = true

  enable_auto_scaling = var.enable_auto_scaling
  min_capacity        = var.min_capacity
  max_capacity        = var.max_capacity
  cpu_target_value    = var.cpu_target_value
  memory_target_value = var.memory_target_value

  log_retention_days     = var.log_retention_days
  enable_execute_command = var.environment == "dev" ? true : false

  tags = var.additional_tags
}