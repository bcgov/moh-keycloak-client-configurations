terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}

variable "realm_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "roles" {
  type = map(string)
}


resource "keycloak_generic_client_role_mapper" "SCOPE-MAPPING" {
  realm_id  = var.realm_id
  client_id = var.client_id
  for_each =    var.roles
  role_id   = each.value

}
