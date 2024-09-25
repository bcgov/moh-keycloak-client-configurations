resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = "https://pharmanetenrolment.gov.bc.ca/gis"
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIME-WEBAPP-ENROLLMENT"
  consent_required                    = false
  description                         = "An application used to transfer GIS account information from LDAP into Keycloak."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PRIME ENROLLMENT"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "*",
  ]
  web_origins = [
    "*",
  ]
}
resource "keycloak_openid_audience_protocol_mapper" "Prime-Audience-Mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_custom_audience = "prime-web-api"
  name                     = "Prime Audience Mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
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
    "account/manage-account" = var.account.ROLES["manage-account"].id,
    "account/view-profile"   = var.account.ROLES["view-profile"].id,
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
