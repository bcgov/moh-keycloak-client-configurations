resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSPP"
  consent_required                    = false
  description                         = "The Health System Performance Portal (HSPP) provides a panoramic analytical view of the health system in British Columbia across the four pillars of the Performance Management Framework"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HSPP"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://hsppstg.hlth.gov.bc.ca/*",
    "https://localhost:44322/*"
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
  client_id_for_role_mappings = "HSPP"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HSPP_ALL" = {
      "name" = "HSPP_ALL"
    },
    "HSPP_OKR" = {
      "name" = "HSPP_OKR"
    },
    "HSPP_HumanResource" = {
      "name" = "HSPP_HumanResource"
    },
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
    "HSPP_ReportProgram_All" = {
      "name" = "HSPP_ReportProgram_All"
    },
    "HSPP_ReportSection_All" = {
      "name" = "HSPP_ReportSection_All"
    },
  }
}