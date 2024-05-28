resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "UMC-E2E-TESTS"
  consent_required                    = false
  description                         = "The purpouse of this client is to define roles, that are later assigned to test accounts in E2E tests."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "UMC-E2E-TESTS"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:8080"
  ]
  web_origins = [
    "+"
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "E2E-ROLE-1" = {
      "name" = "E2E-ROLE-1"
    },
    "E2E-ROLE-2" = {
      "name" = "E2E-ROLE-2"
    }
  }
}
