resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRP-WEB"
  consent_required                    = false
  description                         = "Provider Reporting Portal Frontend"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PRP"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://uatprp.hlth.gov.bc.ca/*",
    "https://prp.hlth.gov.bc.ca/*",
    "https://localhost:44325/*",
  ]
  web_origins = [
    "*",
  ]
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

resource "keycloak_openid_user_attribute_protocol_mapper" "common_provider_number" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "common_provider_number"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "common_provider_number"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PRP-SERVICE"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
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

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_mailboxOrgCode" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_mailboxOrgCode"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_mailboxOrgCode"
  user_attribute  = "idir_mailboxOrgCode"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PRP-SERVICE/HI_Administrator"        = var.PRP-SERVICE.ROLES["HI_Administrator"].id,
    "PRP-SERVICE/PRP_MSPQI"               = var.PRP-SERVICE.ROLES["PRP_MSPQI"].id,
    "PRP-SERVICE/PRP_PMP"                 = var.PRP-SERVICE.ROLES["PRP_PMP"].id,
    "PRP-SERVICE/PRP_PMP_RLS"             = var.PRP-SERVICE.ROLES["PRP_PMP_RLS"].id,
    "PRP-SERVICE/PRP_ReportProgram_MSPQI" = var.PRP-SERVICE.ROLES["PRP_ReportProgram_MSPQI"].id,
    "PRP-SERVICE/PRP_MSPQI_RLS"           = var.PRP-SERVICE.ROLES["PRP_MSPQI_RLS"].id,
    "PRP-SERVICE/PRP_ReportProgram_PMP"   = var.PRP-SERVICE.ROLES["PRP_ReportProgram_PMP"].id,
    "PRP-SERVICE/PRP_ReportSection_MSPQI" = var.PRP-SERVICE.ROLES["PRP_ReportSection_MSPQI"].id,
    "PRP-SERVICE/PRP_ReportSection_PMP"   = var.PRP-SERVICE.ROLES["PRP_ReportSection_PMP"].id,
    "LICENCE-STATUS/MOA"                  = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER"         = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD"                   = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP"                  = var.LICENCE-STATUS.ROLES["RNP"].id
    "LICENCE-STATUS/PHARM"                = var.LICENCE-STATUS.ROLES["PHARM"].id
  }
}
