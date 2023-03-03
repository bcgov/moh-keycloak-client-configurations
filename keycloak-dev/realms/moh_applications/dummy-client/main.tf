resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "dummy-client"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "get-org" = {
      "name"        = "get-org"
      "description" = ""
    },
    "add-org" = {
      "name"        = "add-org"
      "description" = ""
    },
  }
}

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "realm-management/view-clients"  = var.realm-management.ROLES["view-clients"].id,
    "realm-management/manage-events" = var.realm-management.ROLES["manage-events"].id
  }
}

module "service-account-roles" {
  source                  = "../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "realm-management/manage-events" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-events"
    }
  }
}
