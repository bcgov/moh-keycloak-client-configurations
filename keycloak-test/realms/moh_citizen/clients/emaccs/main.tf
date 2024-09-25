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
    "http://localhost:8080/*",
    "https://emaccsd.hlth.gov.bc.ca/*",
    "https://emaccsuat.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
  web_origins = [
  ]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "idir_user_guid" {
  add_to_access_token = true
  add_to_id_token = var.client_role_mapper_add_to_id_token
  add_to_userinfo = var.client_role_mapper_add_to_userinfo
  claim_name      = "idir_user_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_user_guid"
  user_attribute  = "siteminder_user_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "bceid_user_guid" {
  add_to_access_token = true
  add_to_id_token = var.client_role_mapper_add_to_id_token
  add_to_userinfo = var.client_role_mapper_add_to_userinfo
  claim_name      = "bceid_user_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bceid_user_guid"
  user_attribute  = "siteminder_user_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}