resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://hdpbc-tst.hlth.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "HDPBC"
  consent_required                    = false
  description                         = "Health Data Platform BC"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HDPBC"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://hdpbc-tst.hlth.gov.bc.ca/*",
    "https://dmz1.hdpbc-tst.hlth.gov.bc.ca/*",
    "https://dmz2.hdpbc-tst.hlth.gov.bc.ca/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_company" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "idir_company"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_company"
  user_attribute  = "idir_company"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_generic_client_protocol_mapper" "session_state" {
  realm_id        = keycloak_openid_client.CLIENT.realm_id
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "session_state"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-session-state-mapper"
  config = {
    "id.token.claim" : "true",
    "lightweight.claim" : "false",
    "access.token.claim" : "true",
    "introspection.token.claim" : "true",
    "userinfo.token.claim" : "true"
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins",
    "basic"
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  optional_scopes = [
    "address",
    "microprofile-jwt",
    "offline_access",
    "phone"
  ]
}
