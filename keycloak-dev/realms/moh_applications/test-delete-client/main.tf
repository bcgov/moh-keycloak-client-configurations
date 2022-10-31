resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = false
  base_url                            = "https://user-management-dev.hlth.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "TEST-DELETE-CLIENT"
  consent_required                    = false
  description                         = "Another client to test Fridays nuke"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Scope Mapping"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
  ]
  web_origins = [
    "*",
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "some_test_role" = {
      "name" = "some_test_role"
    },
  }
}
module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "TEST-DELETE-CLIENT-SERVICE/first-test-role"  = var.TEST-DELETE-CLIENT-SERVICE.ROLES["first-test-role"].id,
    "TEST-DELETE-CLIENT-SERVICE/third-test-role"  = var.TEST-DELETE-CLIENT-SERVICE.ROLES["third-test-role"].id,
    "TEST-DELETE-CLIENT-SERVICE/fourth-test-role" = var.TEST-DELETE-CLIENT-SERVICE.ROLES["fourth-test-role"].id,
  }
}
