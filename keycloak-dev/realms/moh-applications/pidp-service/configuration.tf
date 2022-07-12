terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}


variable "USER-MANAGEMENT-SERVICE" {
}

output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}
output "ROLES" {
  value = module.client-roles.ROLES
}