resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan        = ""
  access_type                  = "CONFIDENTIAL"
  base_url                     = "https://mohsn.service-now.com"
  client_authenticator_type    = "client-secret"
  client_id                    = "MOH-SERVICENOW"
  consent_required             = false
  description                  = "Health eServices Portal"
  direct_access_grants_enabled = false
  enabled                      = true
  frontchannel_logout_enabled  = false
  full_scope_allowed           = false
  implicit_flow_enabled        = false
  name                         = "HLTH ServiceNow"
  pkce_code_challenge_method   = ""
  realm_id                     = "moh_applications"
  service_accounts_enabled     = false
  standard_flow_enabled        = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://dev.HealthServicesPortal.gov.bc.ca/*",
  ]
  web_origins = [
    "+",
  ]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "idir_company" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_company"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_company"
  user_attribute  = "idir_company"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "identity_provider"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}
resource "keycloak_generic_client_protocol_mapper" "phsa_windowsaccountname" {
  realm_id        = keycloak_openid_client.CLIENT.realm_id
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "preferred_username"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-override-usermodel-attribute-mapper"
  config = {
    "userinfo.token.claim" : "true",
    "user.attribute" : "phsa_windowsaccountname",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "preferred_username",
    "jsonType.label" : "String",
'
  }
}
