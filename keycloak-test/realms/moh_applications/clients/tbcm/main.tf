resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "TBCM"
  consent_required                    = false
  description                         = "Team Based Care Manager. The application allows team leads to plan out shift assignments for health care workers."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "TBCM"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:3000/*",
    "https://d3qshnmydybt5m.cloudfront.net/*",
    "https://d1xxd26qe80lqw.cloudfront.net/*",
    "https://test.moc.gov.bc.ca/*",
    "https://dev.moc.gov.bc.ca/*"
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "admin" = {
      "name" = "admin"
    },
    "user" = {
      "name" = "user"
    },
  }
}
resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "resource_access.$${client_id}.roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "TBCM"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
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
    "introspection.token.claim" = "false"
  }
}
