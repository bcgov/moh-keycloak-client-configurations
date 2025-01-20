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
    "https://sithicliip.healthideas.gov.bc.ca/*",
    "https://uathsiar.healthideas.gov.bc.ca/*",
    "https://devsecure.healthideas.gov.bc.ca/*",
    "https://uatsecure.healthideas.gov.bc.ca/*",
    "https://uatexternal.healthideas.gov.bc.ca/*"

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

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_access_token = true
  add_to_id_token     = true
  claim_name          = "identity_provider"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "IDP"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
  session_note        = "identity_provider"
}

resource "keycloak_openid_user_client_role_protocol_mapper" "licence_status_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "licence_status"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "LICENCE-STATUS"
  multivalued                 = true
  name                        = "licence status"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"                  = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER"         = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD"                   = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP"                  = var.LICENCE-STATUS.ROLES["RNP"].id
    "LICENCE-STATUS/PHARM"                = var.LICENCE-STATUS.ROLES["PHARM"].id
  }
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HI_Administrator" = {
      "name" = "HI_Administrator"
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
    "HI_HSIAR" = {
      "name" = "HI_HSIAR"
    },
    "REPORTS_ADMIN_UAT" = {
      "name" = "REPORTS_ADMIN_UAT"
    },
    "REPORTS_ADMIN_DEV" = {
      "name" = "REPORTS_ADMIN_DEV"
    },
    "HI_External_User" = {
      "name" = "HI_External_User"
    },
    "HI_External_Tester" = {
      "name" = "HI_External_Tester"
    },
    "HI_Secure_User" = {
      "name" = "HI_Secure_User"
    },
    "HI_Secure_Integration_User" = {
      "name" = "HI_Secure_Integration_User"
    },
    "HI_Secure_Tester" = {
      "name" = "HI_Secure_Tester"
    },
    "HI_Developer" = {
      "name" = "HI_Developer"
    },
    "HI_Management" = {
      "name" = "HI_Management"
    },
    "HI_HIDES_User" = {
      "name" = "HI_HIDES_User"
    },
    "HI_ReportProgram_Management" = {
      "name" = "HI_ReportProgram_Management"
    },
    "HI_ReportSection_Management" = {
      "name" = "HI_ReportSection_Management"
    }
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
