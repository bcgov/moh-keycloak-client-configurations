resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "LDAP-ACC-TRANS"
  consent_required                    = false
  description                         = "An application used to transfer MSPDirect account information from LDAP into Keycloak"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "LDAP Account Transfer"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  valid_redirect_uris = [
    "https://accounttransfer-test.apps.silver.devops.gov.bc.ca/*",
  ]
  web_origins = [
    "+",
  ]
}
resource "keycloak_openid_audience_protocol_mapper" "LDAP-ACC-TRANS-aud-mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_custom_audience = "LDAP-ACCOUNT-TRANSFER-API"
  name                     = "LDAP-ACC-TRANS aud mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "IDP"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}
