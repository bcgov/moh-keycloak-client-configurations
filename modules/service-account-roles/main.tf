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

variable "realm_roles" {
  type        = map(string)
}

variable "client_roles" {
    type = map(object({
    client_id = string
    role_id = string
  }))
}

resource "keycloak_openid_client_service_account_realm_role" "ROLE" {
  realm_id                = var.realm_id
  service_account_user_id = var.service_account_user_id
  for_each                = var.realm_roles
  role                    = each.value
}

resource "keycloak_openid_client_service_account_role" "ROLE" {
  realm_id                = var.realm_id
  service_account_user_id = var.service_account_user_id
  for_each                = var.client_roles
  client_id               = each.value.client_id
  role                    = each.value.role_id
}