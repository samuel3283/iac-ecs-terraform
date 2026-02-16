# Este archivo se configurará por ambiente
# Ejemplo para dev:

terraform {
  backend "s3" {
    bucket = "terraromf-s3-iac-ecs-retos"
    key    = "dev/aws-terraform-reto.tfstate"
    region = "us-east-1"
  }
}
