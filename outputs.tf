output "vpc_id" {
  description = "ID de la VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.networking.public_subnet_ids
}

output "nlb_dns_name" {
  description = "DNS name del Network Load Balancer"
  value       = module.load_balancer.nlb_dns_name
}

output "nlb_arn" {
  description = "ARN del NLB"
  value       = module.load_balancer.nlb_arn
}

output "ecs_cluster_id" {
  description = "ID del cluster ECS"
  value       = module.ecs.cluster_id
}

#output "ecs_service_name" {
#  description = "Nombre del servicio ECS"
#  value       = module.ecs.service_name
#}

output "application_endpoint" {
  description = "Endpoint de la aplicación (usar con el puerto correcto)"
  value       = "${module.load_balancer.nlb_dns_name}:${var.listener_port}"
}
