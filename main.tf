
# Módulo de Networking
module "networking" {
  source = "./modules/networking"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  tags                = var.tags
}

# Módulo de Security Groups
module "security_groups" {
  source = "./modules/security-groups"

  project_name   = var.project_name
  vpc_id         = module.networking.vpc_id
  container_port = var.container_port
  tags           = var.tags
}

# Módulo de Load Balancer (NLB)
module "load_balancer" {
  source = "./modules/load-balancer"

  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  container_port    = var.container_port
  listener_port     = var.listener_port

  health_check_interval            = var.health_check_interval
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold

  enable_deletion_protection = var.enable_deletion_protection
  enable_tls                 = var.enable_tls
  certificate_arn            = var.certificate_arn

  tags = var.tags
}

# Módulo de ECS
module "ecs" {
  source = "./modules/ecs"

  project_name                = var.project_name
  aws_region                  = var.aws_region
  public_subnet_ids           = module.networking.public_subnet_ids
  ecs_tasks_security_group_id = module.security_groups.ecs_tasks_security_group_id
  target_group_arn            = module.load_balancer.target_group_arn

  container_name        = var.container_name
  container_image       = var.container_image
  container_port        = var.container_port
  container_environment = var.container_environment

  task_cpu                  = var.task_cpu
  task_memory               = var.task_memory
  desired_count             = var.desired_count
  enable_container_insights = var.enable_container_insights
  log_retention_days        = var.log_retention_days

  tags = var.tags
}


# Módulo de ECR
module "ecr" {
  source = "./modules/ecr"

  environment     = var.environment
  repository_name = var.project_name
  max_image_count = 10

  tags = var.tags
}
