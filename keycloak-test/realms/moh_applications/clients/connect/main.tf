resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://connect-test.health.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "CONNECT"
  consent_required                    = false
  description                         = "Ministry of Health Extranet"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "CONNECT"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://connect-test-d7.health.gov.bc.ca/*",
    "https://connect-test.health.gov.bc.ca/*",
    "https://dmz-1.connect-test-d7.health.gov.bc.ca/*",
    "https://dmz-2.connect-test-d7.health.gov.bc.ca/*",
    "https://dmz-1.connect-test.health.gov.bc.ca/*",
    "https://dmz-2.connect-test.health.gov.bc.ca/*"
  ]
  web_origins = [
  ]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "bceid_business_legalName" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "bceid_business_legalName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bceid_business_legalName"
  user_attribute  = "bceid_business_legalName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
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

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins"
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
