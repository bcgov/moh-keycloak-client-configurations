resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "USER-MANAGEMENT-SERVICE-INTEGRATION-TESTS"
  consent_required                    = false
  description                         = "A better pattern for integration tests that clear-up user management service client"
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
  use_refresh_tokens                  = true
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
    "USER-MANAGEMENT-SERVICE/create-user"         = var.ORGANIZATIONS-API.ROLES["create-user"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-details" = var.ORGANIZATIONS-API.ROLES["manage-user-details"].id,
    "USER-MANAGEMENT-SERVICE/manage-all-groups"   = var.ORGANIZATIONS-API.ROLES["manage-all-groups"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-roles"   = var.ORGANIZATIONS-API.ROLES["manage-user-roles"].id,
    "USER-MANAGEMENT-SERVICE/view-client-fmdb"    = var.ORGANIZATIONS-API.ROLES["view-client-fmdb"].id,
    "USER-MANAGEMENT-SERVICE/view-client-gis"     = var.ORGANIZATIONS-API.ROLES["view-client-gis"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"        = var.ORGANIZATIONS-API.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-events"         = var.ORGANIZATIONS-API.ROLES["view-events"].id,
    "USER-MANAGEMENT-SERVICE/view-groups"         = var.ORGANIZATIONS-API.ROLES["view-groups"].id,
    "USER-MANAGEMENT-SERVICE/view-metrics"        = var.ORGANIZATIONS-API.ROLES["view-metrics"].id,
    "USER-MANAGEMENT-SERVICE/view-users"          = var.ORGANIZATIONS-API.ROLES["view-users"].id,
    "USER-MANAGEMENT-SERVICE/manage-users"        = var.ORGANIZATIONS-API.ROLES["manage-users"].id,
    "realm-management/manage-users"               = var.realm-management.ROLES["manage-users"].id,
    "realm-management/view-clients"               = var.realm-management.ROLES["view-clients"].id,
    "realm-management/view-events"                = var.realm-management.ROLES["view-events"].id,
    "realm-management/view-users"                 = var.realm-management.ROLES["view-users"].id,
    "ORGANIZATIONS-API/get-org"                   = var.ORGANIZATIONS-API.ROLES["get-org"].id,
    "ORGANIZATIONS-API/add-org"                   = var.ORGANIZATIONS-API.ROLES["add-org"].id,
    "ORGANIZATIONS-API/delete-org"                = var.ORGANIZATIONS-API.ROLES["delete-org"].id,
  }
}

module "service-account-roles" {
  source                  = "../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "offline_access"    = "offline_access",
    "uma_authorization" = "uma_authorization",
  }
  client_roles = {
    "USER-MANAGEMENT-SERVICE/create-user" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "create-user"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-details" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "manage-user-details"
    }
    "USER-MANAGEMENT-SERVICE/manage-all-groups" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "manage-all-groups"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-roles" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "manage-user-roles"
    }
    "USER-MANAGEMENT-SERVICE/view-client-fmdb" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-client-fmdb"
    }
    "USER-MANAGEMENT-SERVICE/view-client-gis" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-client-gis"
    }
    "USER-MANAGEMENT-SERVICE/view-clients" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "USER-MANAGEMENT-SERVICE/view-events" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-events"
    }
    "USER-MANAGEMENT-SERVICE/view-groups" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-groups"
    }
    "USER-MANAGEMENT-SERVICE/view-metrics" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-metrics"
    }
    "USER-MANAGEMENT-SERVICE/view-users" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "view-users"
    }
    "realm-management/manage-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-users"
    }
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "realm-management/view-events" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-events"
    }
    "realm-management/view-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-users"
    }
    "ORGANIZATIONS-API/get-org" = {
      "client_id" = var.ORGANIZATIONS-API.CLIENT.id,
      "role_id"   = "get-org"
    }
    "ORGANIZATIONS-API/add-org" = {
      "client_id" = var.ORGANIZATIONS-API.CLIENT.id,
      "role_id"   = "add-org"
    }
    "ORGANIZATIONS-API/delete-org" = {
      "client_id" = var.ORGANIZATIONS-API.CLIENT.id,
      "role_id"   = "delete-org"
    }
  }
}
