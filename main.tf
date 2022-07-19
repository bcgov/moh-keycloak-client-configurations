terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 1.1.0"

  backend "s3" {
    bucket = "cey5wq-sandbox-moh-keycloak-terraform-state"
    key    = "moh-keycloak-terraform-state"
    region = "ca-central-1"
  }
}

module "KEYCLOAK_DEV" {
  source = "./keycloak-dev"

  client_id     = var.dev_client_id
  client_secret = var.dev_client_secret
  keycloak_url  = var.dev_keycloak_url
}

# module "KEYCLOAK_TEST" {
#   source = "./keycloak-test"

#   client_id     = var.test_client_id
#   client_secret = var.test_client_secret
#   keycloak_url  = var.test_keycloak_url
# }

module "KEYCLOAK_PROD" {
  source = "./keycloak-prod"

  client_id     = var.prod_client_id
  client_secret = var.prod_client_secret
  keycloak_url  = var.prod_keycloak_url
}