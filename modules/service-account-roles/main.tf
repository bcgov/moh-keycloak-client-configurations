terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}

variable "realm_id" {
  type        = string
}

variable "service_account_user_id" {
  type        = string
}

variable "client_id" {
  type        = string
}

variable "roles" {
  type        = map(string)
}

resource "keycloak_openid_client_service_account_role" "client2_service_account_role" {
  realm_id                = var.realm_id
  service_account_user_id = var.service_account_user_id
  client_id               = var.client_id
  for_each                = var.roles
  role                    = each.value
}