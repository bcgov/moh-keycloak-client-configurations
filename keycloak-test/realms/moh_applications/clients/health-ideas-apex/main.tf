resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HEALTH-IDEAS-APEX"
  consent_required                    = false
  description                         = "HealthIdeas Reporting Application - Oracle APEX"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HEALTH-IDEAS-APEX"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://devsecure.healthideas.gov.bc.ca/*",
    "https://uatsecure.healthideas.gov.bc.ca/*",
    "https://devsecuret.healthideas.gov.bc.ca/*",
    "https://uatsecuret.healthideas.gov.bc.ca/*",
    "https://uatexternal.healthideas.gov.bc.ca/*",
    "https://uatexternalt.healthideas.gov.bc.ca/*"
  ]
  web_origins = [

  ]
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