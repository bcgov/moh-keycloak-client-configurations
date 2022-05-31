terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}

module "moh_applications" {
  source = "./realms/moh-applications"
}

provider "keycloak" {
  realm         = "moh_applications"
  client_id     = var.client_id
  client_secret = var.client_secret
  url           = var.keycloak_url
}