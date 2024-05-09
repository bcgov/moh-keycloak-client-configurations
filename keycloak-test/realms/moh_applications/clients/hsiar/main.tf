resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSIAR"
  consent_required                    = false
  description                         = "HSIAR client represents HealthIdeas centralized information internal portal (HI-CLIIP) which is used to provide good user experience in viewing Power BI reports and other documents."
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
    "http://localhost:*",
    "https://localhost:*",
    "https://uathicliip.healthideas.gov.bc.ca/*",
    "https://devhicliip.healthideas.gov.bc.ca/*",
    "https://sithicliip.healthideas.gov.bc.ca/*"
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
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
    "HI_SUPPORT_ROLE_PROGRAM" = {
      "name" = "HI_SUPPORT_ROLE_PROGRAM"
    },
    "HI_SUPPORT_ROLE_SECTION" = {
      "name" = "HI_SUPPORT_ROLE_SECTION"
    },
    "HI_SUPPORT_ROLE" = {
      "name" = "HI_SUPPORT_ROLE"
    },
    "HI_Operation" = {
      "name" = "HI_Operation"
    },
    "HI_ReportProgram_CCHS" = {
      "name" = "HI_ReportProgram_CCHS"
    },
    "HI_ReportProgram_External" = {
      "name" = "HI_ReportProgram_External"
    },
    "HI_ReportProgram_HSIAR" = {
      "name" = "HI_ReportProgram_HSIAR"
    },
    "HI_ReportProgram_Secure" = {
      "name" = "HI_ReportProgram_Secure"
    },
    "HI_ReportSection_CCHS" = {
      "name" = "HI_ReportSection_CCHS"
    },
    "HI_ReportSection_External" = {
      "name" = "HI_ReportSection_External"
    },
    "HI_ReportSection_HSIAR" = {
      "name" = "HI_ReportSection_HSIAR"
    },
    "HI_ReportSection_Secure" = {
      "name" = "HI_ReportSection_Secure"
    },
    "HI_CCHS" = {
      "name" = "HI_CCHS"
    },
    "HI_External" = {
      "name" = "HI_External"
    },
    "HI_HSIAR" = {
      "name" = "HI_HSIAR"
    },
    "HI_Secure" = {
      "name" = "HI_Secure"
    },
  }
}
resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "preferred_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "phsa_windowsaccoutname"
  user_attribute  = "phsa_windowsaccoutname"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
