# Este archivo se configurará por ambiente
# Ejemplo para dev:

terraform {
  backend "s3" {
    bucket = "storage-iac-reto"
    key    = "dev/aws-terraform-reto.tfstate"
    region = "us-east-1"
  }
}
