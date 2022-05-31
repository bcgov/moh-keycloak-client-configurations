terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "example-org-f085f7"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

module "keycloak_dev" {
  source = "./keycloak-dev"

  client_id     = var.dev_client_id
  client_secret = var.dev_client_secret
  keycloak_url  = var.dev_keycloak_url
}

module "keycloak_test" {
  source = "./keycloak-test"

  client_id     = var.test_client_id
  client_secret = var.test_client_secret
  keycloak_url  = var.test_keycloak_url
}