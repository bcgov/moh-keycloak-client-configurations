terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}

variable "client_id" {
  description = "TODO"
  type        = string

}

variable "claim_name" {
  description = "TODO"
  type        = string
}

variable "base_url" {
  description = "TODO"
  type        = string
}

variable "description" {
  description = "TODO"
  type        = string
}

variable "valid_redirect_uris" {
  type = list
}

variable "roles" {
  type = map(object({
    name = string
    description = string
  }))
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
  name                        = var.client_id
  # oauth2_device_authorization_grant_enabled  = false
  realm_id                 = "moh_applications"
  service_accounts_enabled = false
  standard_flow_enabled    = true
  use_refresh_tokens       = false
  valid_redirect_uris = var.valid_redirect_uris
  web_origins = []
  admin_url   = ""
}
#
#resource "keycloak_role" "MOHUSER" {
#  realm_id    = "moh_applications"
#  client_id   = keycloak_openid_client.CLIENT.id
#  name        = "MOHUSER"
#  description = "The base user permission for FMDB"
#}
#
#resource "keycloak_role" "PSDADMIN" {
#  realm_id    = "moh_applications"
#  client_id   = keycloak_openid_client.CLIENT.id
#  name        = "PSDADMIN"
#  description = "Admin role for FMDB provides access to code table management"
#}

resource "keycloak_role" "ROLE" {
  realm_id    = "moh_applications"
  client_id   = keycloak_openid_client.CLIENT.id
  for_each =    var.roles
  name        = each.value.name
  description = each.value.description
}


resource "keycloak_openid_user_client_role_protocol_mapper" "FMDB_Role_user_client_role_mapper" {
  realm_id   = keycloak_openid_client.CLIENT.realm_id
  client_id  = keycloak_openid_client.CLIENT.id
  name       = "Role mapper"
  claim_name = var.claim_name

  add_to_access_token         = true
  add_to_id_token             = false
  add_to_userinfo             = false
  claim_value_type            = "String"
  client_id_for_role_mappings = var.client_id
  multivalued                 = true
}
