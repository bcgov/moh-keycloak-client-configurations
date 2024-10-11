resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://formsdev.hlth.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "FORMS"
  consent_required                    = false
  description                         = "Ministry of Health Public Forms Server"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "FORMS"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://forms.ddev.site/*",
    "https://formsdev.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://qa-sts.healthbc.org/adfs/ls/*",
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "IDP"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
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
    "idir_aad",
    "phsa",
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
