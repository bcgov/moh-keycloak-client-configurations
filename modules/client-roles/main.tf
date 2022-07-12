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
  type = map(object({
    name = string
    description = string
    composite_roles = list(string)
  }))
}

resource "keycloak_role" "ROLES" {
  realm_id    = var.realm_id
  client_id   = var.client_id
  for_each    = var.roles
  name        = each.value.name
  description = each.value.description
  composite_roles = "${length(each.value.composite_roles) > 0 ? each.value.composite_roles : null}"  

}

output "ROLES" {
  value = keycloak_role.ROLES
}