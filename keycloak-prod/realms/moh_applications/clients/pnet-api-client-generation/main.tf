resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PNET-API-CLIENT-GENERATION"
  consent_required                    = false
  description                         = "Service account used for generating clients to be used by pharmacies."
  direct_access_grants_enabled        = false
  enabled                             = false
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PNET-API-CLIENT-GENERATION"
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
    "realm-management/create-client"  = var.realm-management.ROLES["create-client"].id,
    "realm-management/manage-clients" = var.realm-management.ROLES["manage-clients"].id,
    "realm-management/query-clients"  = var.realm-management.ROLES["query-clients"].id,
    "realm-management/view-clients"   = var.realm-management.ROLES["view-clients"].id,
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
    "realm-management/create-client" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "create-client"
    }
    "realm-management/manage-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-clients"
    }
    "realm-management/query-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "query-clients"
    }
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }

  }
}
