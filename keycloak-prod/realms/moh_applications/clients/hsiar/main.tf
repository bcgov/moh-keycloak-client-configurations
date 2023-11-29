resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSIAR"
  consent_required                    = false
  description                         = "HSIAR client represents HealthIdeas centralized information internal portal which is used to provide good user experience in viewing Power BI reports and other documents."
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
    "https://hicliip.healthideas.gov.bc.ca/*"
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
    "HI_ReportProgram_All" = {
      "name" = "HI_ReportProgram_All"
    },
    "HI_ReportSection_All" = {
      "name" = "HI_ReportSection_All"
    },
    "HI_Consumer" = {
      "name" = "HI_Consumer"
    },
    "HI_Operation" = {
      "name" = "HI_Operation"
    },
    "HI_ReportProgram_CCHS" = {
      "name" = "HI_ReportProgram_CCHS"
    },
    "HI_ReportSection_CCHS" = {
      "name" = "HI_ReportSection_CCHS"
    },
    "HI_CCHS" = {
      "name" = "HI_CCHS"
    },
  }
}