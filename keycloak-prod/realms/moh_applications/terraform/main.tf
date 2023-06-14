resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "terraform"
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

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "realm-management/view-clients"   = var.realm-management.ROLES["view-clients"].id,
    "realm-management/create-client"  = var.realm-management.ROLES["create-client"].id,
    "realm-management/manage-clients" = var.realm-management.ROLES["manage-clients"].id,
    "realm-management/query-clients"  = var.realm-management.ROLES["query-clients"].id,
    "realm-management/view-users"     = var.realm-management.ROLES["view-users"].id,
    "realm-management/manage-users"   = var.realm-management.ROLES["manage-users"].id,
    "realm-management/query-users"    = var.realm-management.ROLES["query-users"].id,
    "realm-management/view-realm"     = var.realm-management.ROLES["view-realm"].id,
    "realm-management/view-events"    = var.realm-management.ROLES["view-events"].id,
    "realm-management/manage-realm"   = var.realm-management.ROLES["manage-realm"].id,

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
    "realm-management/create-client" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "create-client"
    }
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "realm-management/query-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "query-clients"
    }
    "realm-management/manage-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-clients"
    }
    "realm-management/view-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-users"
    }
    "realm-management/query-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "query-users"
    }
    "realm-management/manage-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-users"
    }
    "realm-management/view-realm" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-realm"
    }
    "realm-management/view-events" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-events"
    }
    "realm-management/manage-realm" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-realm"
    }
  }
}
