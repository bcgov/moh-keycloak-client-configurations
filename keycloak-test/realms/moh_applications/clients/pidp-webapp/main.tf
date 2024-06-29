resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PIDP-WEBAPP"
  consent_required                    = false
  description                         = "Provider Identity Portal"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://demo.healthprovideridentityportal.gov.bc.ca/*",
    "https://demo.healthprovideridentityportal.gov.bc.ca",
    "https://test.healthprovideridentityportal.gov.bc.ca/*",
    "https://test.healthprovideridentityportal.gov.bc.ca",
    "http://localhost:4200/*",
  ]
  web_origins = [
    "+",
  ]
}
resource "keycloak_openid_audience_protocol_mapper" "PIDP-SERVICE-aud-mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_client_audience = "PIDP-SERVICE"
  name                     = "PIDP-SERVICE aud mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "given_names" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "given_names"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "given_names"
  user_attribute  = "given_names"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "identity_provider"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}
resource "keycloak_openid_user_attribute_protocol_mapper" "birthdate" {
  claim_name     = "birthdate"
  client_id      = keycloak_openid_client.CLIENT.id
  name           = "birthdate"
  user_attribute = "birthdate"
  realm_id       = keycloak_openid_client.CLIENT.realm_id
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PIDP-SERVICE/ADMIN"             = var.PIDP-SERVICE.ROLES["ADMIN"].id,
    "PIDP-SERVICE/USER"              = var.PIDP-SERVICE.ROLES["USER"].id,
    "PIDP-SERVICE/feature_pidp_demo" = var.PIDP-SERVICE.ROLES["feature_pidp_demo"].id,
    "account/view-profile"           = var.account.ROLES["view-profile"].id,
  }
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
    "jsonType.label" : "String"
  }
}
