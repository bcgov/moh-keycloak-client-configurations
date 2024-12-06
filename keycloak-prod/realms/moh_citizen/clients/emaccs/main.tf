resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "EMACCS"
  consent_required                    = false
  description                         = "Emergency Medical Assistant Continuing Competency System"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "EMACCS"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_citizen"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  valid_redirect_uris = [
    "https://emaccs.hlth.gov.bc.ca/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
  web_origins = [
  ]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "idir_user_guid" {
  add_to_access_token = true
  add_to_id_token     = true
  add_to_userinfo     = true
  claim_name          = "siteminder_user_guid"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "idir_user_guid"
  user_attribute      = "idir_user_guid"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "bceid_user_guid" {
  add_to_access_token = true
  add_to_id_token     = true
  add_to_userinfo     = true
  claim_name          = "siteminder_user_guid"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "bceid_user_guid"
  user_attribute      = "bceid_user_guid"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "SYSADMIN" = {
      "name"        = "SYSADMIN"
      "description" = "System Administrator"
    },
    "CA" = {
      "name"        = "CA"
      "description" = "Clinical Advisor"
    },
    "CCA" = {
      "name"        = "CCA"
      "description" = "Continuing Competence Analyst"
    },
    "DIRECTOR" = {
      "name"        = "DIRECTOR"
      "description" = "Director"
    },
    "READONLY" = {
      "name"        = "READONLY"
      "description" = "Read Only"
    },
  }
}
