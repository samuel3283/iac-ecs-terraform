# Este archivo se configurará por ambiente
# Ejemplo para dev:

terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "dev/ecs-fargate-app/terraform.tfstate"
    region = "us-east-1"
  }
}
