resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "SAT-EFORMS_QA"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "SAT-EFORMS QA"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  valid_redirect_uris = [
    "https://qa.eforms.healthbc.org/oauth2/authorize",
  ]
  web_origins = [
    "+",
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "phsa_eforms_sat" = {
      "name"        = "phsa_eforms_sat"
      "description" = ""
    },
  }
}
resource "keycloak_openid_user_attribute_protocol_mapper" "bcsc_id" {
  add_to_id_token = false
  add_to_userinfo = true
  claim_name      = "bcsc_id"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bcsc_id"
  user_attribute  = "bcsc_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
