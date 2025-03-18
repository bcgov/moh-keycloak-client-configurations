resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "SAT-EFORMS"
  consent_required                    = false
  description                         = "Special Authority Eforms (PHSA)"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "SAT-EFORMS"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://uat.eforms.healthbc.org/oauth2/authorize",
    "https://uat.eforms.healthbc.org/login",
  ]
  web_origins = [
    "+",
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "phsa_eforms_edrd" = {
      "name" = "phsa_eforms_edrd"
    },
    "phsa_eforms_imms" = {
      "name" = "phsa_eforms_imms"
    },
    "phsa_eforms_rxrefill" = {
      "name" = "phsa_eforms_rxrefill"
    },
    "phsa_eforms_sat" = {
      "name" = "phsa_eforms_sat"
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

resource "keycloak_openid_user_attribute_protocol_mapper" "common_provider_number" {
  add_to_id_token     = false
  add_to_userinfo     = false
  add_to_access_token = true
  claim_name          = "common_provider_number"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "common_provider_number"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "pidp_email" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "pidpEmail"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "pidp_email"
  user_attribute      = "pidp_email"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "pidp_phone" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "pidpPhone"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "pidp_phone"
  user_attribute      = "pidp_phone"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
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
