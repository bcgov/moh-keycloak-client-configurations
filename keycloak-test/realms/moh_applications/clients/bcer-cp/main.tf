resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = "https://bcer-test.hlth.gov.bc.ca/portal"
  client_authenticator_type           = "client-secret"
  client_id                           = "BCER-CP"
  consent_required                    = false
  description                         = "The BC E-Substance Reporting application (Data Portal). Collects and reports on information gathered from venders of e-cigarettes and vaping products."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "BCER-CP"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "http://localhost:3001/*",
    "https://localhost:3000/*",
    "https://localhost:3001/*",
    "https://bcer-dev.hlth.gov.bc.ca/portal/*",
    "https://bcer-test.hlth.gov.bc.ca/portal/*",
    "https://d3naoa5ica8tt3.cloudfront.net/portal/*",
  ]
  web_origins = [
    "+",
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "bcer_admin" = {
      "name" = "bcer_admin"
    },
    "health_authority" = {
      "name" = "health_authority"
    },
    "moh_admin" = {
      "name" = "moh_admin"
    },
  }
}

resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "preferred_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "phsa_windowsaccoutname"
  user_attribute  = "phsa_windowsaccoutname"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
