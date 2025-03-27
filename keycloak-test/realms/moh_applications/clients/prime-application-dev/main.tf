resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIME-APPLICATION-DEV"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "*"
  ]
  web_origins = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "acr",
    "address",
    "basic",
    "email",
    "profile",
    "roles",
    "web-origins",
  ]
}

resource "keycloak_openid_user_attribute_protocol_mapper" "birthdate" {
  claim_name     = "birthdate"
  client_id      = keycloak_openid_client.CLIENT.id
  name           = "birthdate"
  user_attribute = "birthdate"
  realm_id       = keycloak_openid_client.CLIENT.realm_id
}