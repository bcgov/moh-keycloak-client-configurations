resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "TEST-DELETE-CLIENT-SERVICE"
  consent_required                    = false
  description                         = "Client to test the nuke that happened on Friday"
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
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "first-test-role" = {
      "name" = "first-test-role"
    },
    "second-test-role" = {
      "name" = "second-test-role"
    },
    "third-test-role" = {
      "name" = "third-test-role"
    },
    "fourth-test-role" = {
      "name" = "fourth-test-role"
    },
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
    "TEST-DELETE-CLIENT-SERVICE/first-test-role" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "first-test-role"
    }
    "TEST-DELETE-CLIENT-SERVICE/second-test-role" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "second-test-role"
    }
    "TEST-DELETE-CLIENT-SERVICE/third-test-role" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "third-test-role"
    }
  }
}
