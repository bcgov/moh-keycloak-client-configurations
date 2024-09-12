terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "3.9.1"
    }
  }
}

variable "client_id" {
  type = string
}

variable "client_name" {
  type = string
}

variable "claim_name" {
  type = string
}

variable "base_url" {
  type = string
}

variable "description" {
  type = string
}

variable "login_theme" {
  type    = string
  default = null
}

variable "mapper_name" {
  type = string
}

variable "valid_redirect_uris" {
  type = list(any)
}

variable "service_accounts_enabled" {
  type = string
}

variable "use_refresh_tokens" {
  type    = bool
  default = false
}

variable "client_role_mapper_add_to_id_token" {
  type    = bool
  default = false
}

variable "client_role_mapper_add_to_userinfo" {
  type    = bool
  default = false
}

variable "roles" {
  type = map(map(string))
}

variable "authentication_flow_binding_override_browser_id" {
  type        = string
  default     = null
  description = "Authentication flow binding overrides - used by IDP restriction module."
}


resource "keycloak_openid_client" "CLIENT" {
  access_type = "CONFIDENTIAL"
  # backchannel_logout_revoke_offline_sessions = false
  backchannel_logout_session_required = false
  base_url                            = var.base_url
  client_authenticator_type           = "client-secret"
  client_id                           = var.client_id
  consent_required                    = false
  description                         = var.description
  direct_access_grants_enabled        = false
  # display_on_consent_screen                  = false
  enabled = true
  # extra_config                               = {}
  frontchannel_logout_enabled = false
  full_scope_allowed          = false
  implicit_flow_enabled       = false
  login_theme                 = var.login_theme
  name                        = var.client_name
  # oauth2_device_authorization_grant_enabled  = false
  realm_id                 = "moh_applications"
  service_accounts_enabled = var.service_accounts_enabled
  standard_flow_enabled    = true
  use_refresh_tokens       = var.use_refresh_tokens
  valid_redirect_uris      = var.valid_redirect_uris
  web_origins              = []
  admin_url                = ""
  dynamic "authentication_flow_binding_overrides" {
    for_each = var.authentication_flow_binding_override_browser_id != null ? [1] : []
    content {
      browser_id = var.authentication_flow_binding_override_browser_id
    }
  }
}

resource "keycloak_role" "ROLES" {
  realm_id    = "moh_applications"
  client_id   = keycloak_openid_client.CLIENT.id
  for_each    = var.roles
  name        = each.value.name
  description = contains(keys(each.value), "description") ? (each.value.description) : ""
  # description = each.value.description
  lifecycle {
    prevent_destroy = true
  }
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  realm_id   = keycloak_openid_client.CLIENT.realm_id
  client_id  = keycloak_openid_client.CLIENT.id
  name       = var.mapper_name
  claim_name = var.claim_name

  add_to_access_token         = true
  add_to_id_token             = var.client_role_mapper_add_to_id_token
  add_to_userinfo             = var.client_role_mapper_add_to_userinfo
  claim_value_type            = "String"
  client_id_for_role_mappings = var.client_id
  multivalued                 = true
}

output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}

output "ROLES" {
  value = keycloak_role.ROLES
}