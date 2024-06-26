resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "USAM"
  consent_required                    = false
  description                         = "Unified Secure Account Management. This application will be used to enable Healthideas users with Oracle accounts to self-unlock their accounts within specific circumstances."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "USAM"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://devsecure.healthideas.gov.bc.ca/usam/*",
    "https://decumaria.hlth.gov.bc.ca:8090/usam/*",
    "https://uatsecure.healthideas.gov.bc.ca/*",
    "https://uatsecuret.healthideas.gov.bc.ca/*"
  ]
  web_origins = [
    "+"
  ]
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_username" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_username"
  user_attribute  = "idir_username"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_user_guid" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_user_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_user_guid"
  user_attribute  = "idir_user_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}