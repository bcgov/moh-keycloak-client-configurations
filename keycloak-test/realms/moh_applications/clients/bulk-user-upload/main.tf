resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "BULK-USER-UPLOAD"
  consent_required                    = false
  description                         = "Service account used for bulk user upload and role assignment."
  direct_access_grants_enabled        = false
  enabled                             = false
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "BULK-USER-UPLOAD"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = false
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "realm-management/manage-users"  = var.realm-management.ROLES["manage-users"].id,
    "realm-management/query-clients" = var.realm-management.ROLES["query-clients"].id,
    "realm-management/query-users"   = var.realm-management.ROLES["query-users"].id,
    "realm-management/view-clients"  = var.realm-management.ROLES["view-clients"].id,
    "realm-management/view-users"    = var.realm-management.ROLES["view-users"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "realm-management/manage-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-users"
    }
    "realm-management/query-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "query-clients"
    }
    "realm-management/query-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "query-users"
    }
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "realm-management/view-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-users"
    }
  }
}
