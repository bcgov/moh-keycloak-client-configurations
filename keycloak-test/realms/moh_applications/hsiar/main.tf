resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSIAR"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HSIAR"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "*"
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "HSIAR"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "Surgical" = {
      "name" = "Surgical"
    },
    "Ed" = {
      "name" = "Ed"
    },
    "HI_Operation" = {
      "name" = "HI_Operation"
    },
    "HI_Consumer" = {
      "name" = "HI_Consumer"
    },
    "HSPP_HumanResource" = {
      "name" = "HSPP_HumanResource"
    },
    "HSPP_OKR" = {
      "name" = "HSPP_OKR"
    },
    "AD_Education" = {
      "name" = "AD_Education"
    },
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
  }
}