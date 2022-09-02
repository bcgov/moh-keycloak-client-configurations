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
  type = map(map(string))
}

resource "keycloak_role" "ROLES" {
  realm_id    = var.realm_id
  client_id   = var.client_id
  for_each    = var.roles
  # we don't need to check if name is specified -  we want the error to show up if name is not specified
  name        = each.value.name
  # terraform does not short circuit conditionals, so a check to see if the key exists must happen before taking the length of the value.
  description = "${contains( keys(each.value), "description" )? (each.value.description) : ""}"
  lifecycle {
    prevent_destroy = true
  }
}

output "ROLES" {
  value = keycloak_role.ROLES
}