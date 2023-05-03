resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "UMS-INTEGRATION-TESTS"
  consent_required                    = false
  description                         = "Service account for User Management Service integration tests"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "UMS-INTEGRATION-TESTS"
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

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "TEST_ROLE" = {
      "name"        = "TEST_ROLE"
      "description" = "Role used in UMS integration tests"
    },
  }
}

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "USER-MANAGEMENT-SERVICE/create-user"                       = var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-details"               = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    "USER-MANAGEMENT-SERVICE/manage-all-groups"                 = var.USER-MANAGEMENT-SERVICE.ROLES["manage-all-groups"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-roles"                 = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    "USER-MANAGEMENT-SERVICE/view-client-ums-integration-tests" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-ums-integration-tests"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-events"                       = var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    "USER-MANAGEMENT-SERVICE/view-groups"                       = var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    "USER-MANAGEMENT-SERVICE/view-metrics"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
    "USER-MANAGEMENT-SERVICE/view-users"                        = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
    "realm-management/manage-users"                             = var.realm-management.ROLES["manage-users"].id,
    "realm-management/view-clients"                             = var.realm-management.ROLES["view-clients"].id,
    "realm-management/view-events"                              = var.realm-management.ROLES["view-events"].id,
    "realm-management/view-users"                               = var.realm-management.ROLES["view-users"].id,
    "ORGANIZATIONS-API/get-org"                                 = var.ORGANIZATIONS-API.ROLES["get-org"].id,
    "ORGANIZATIONS-API/add-org"                                 = var.ORGANIZATIONS-API.ROLES["add-org"].id,
    "ORGANIZATIONS-API/delete-org"                              = var.ORGANIZATIONS-API.ROLES["delete-org"].id,
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
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "create-user"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-details" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "manage-user-details"
    }
    "USER-MANAGEMENT-SERVICE/manage-all-groups" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "manage-all-groups"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-roles" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "manage-user-roles"
    }
    "USER-MANAGEMENT-SERVICE/view-client-ums-integration-tests" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-ums-integration-tests"
    }
    "USER-MANAGEMENT-SERVICE/view-clients" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "USER-MANAGEMENT-SERVICE/view-events" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-events"
    }
    "USER-MANAGEMENT-SERVICE/view-groups" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-groups"
    }
    "USER-MANAGEMENT-SERVICE/view-metrics" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-metrics"
    }
    "USER-MANAGEMENT-SERVICE/view-users" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
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
