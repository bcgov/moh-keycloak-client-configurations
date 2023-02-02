terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
  required_version = "= 1.3.7"

  backend "s3" {
    bucket = "cey5wq-sandbox-moh-keycloak-terraform-state"
    key    = "moh-keycloak-terraform-state"
    region = "ca-central-1"
  }
}