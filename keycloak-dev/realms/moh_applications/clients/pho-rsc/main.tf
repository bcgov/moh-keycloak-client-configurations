resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan                    = ""
  access_type                              = "CONFIDENTIAL"
  backchannel_logout_session_required      = true
  base_url                                 = ""
  client_authenticator_type                = "client-secret"
  client_id                                = "PHO-RSC"
  consent_required                         = false
  description                              = "PHO RStudio Connect Analytics Platform"
  direct_access_grants_enabled             = false
  enabled                                  = true
  exclude_session_state_from_auth_response = false
  frontchannel_logout_enabled              = false
  full_scope_allowed                       = false
  implicit_flow_enabled                    = false
  name                                     = "OPHO Posit Connect"
  pkce_code_challenge_method               = ""
  realm_id                                 = "moh_applications"
  service_accounts_enabled                 = false
  standard_flow_enabled                    = true
  use_refresh_tokens                       = false
  valid_redirect_uris = [
    "http://tussle.hlth.gov.bc.ca/*",
    "https://tussle.hlth.gov.bc.ca/*",
    "http://rsc-stg.hlth.gov.bc.ca/*",
    "https://rsc-stg.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://rsc-test.hlth.gov.bc.ca/*"
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
    "administrator" = {
      "name"        = "administrator"
      "description" = ""
    },
    "viewer" = {
      "name"        = "viewer"
      "description" = ""
    },
    "publisher" = {
      "name"        = "publisher"
      "description" = ""
    }
  }
}
resource "keycloak_openid_user_client_role_protocol_mapper" "PHO-RSC-Role" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  name                        = "PHO-RSC Role"
  claim_name                  = "pho-rsc_role"
  claim_value_type            = "String"
  add_to_access_token         = false
  add_to_userinfo             = false
  client_id_for_role_mappings = "PHO-RSC"
}
resource "keycloak_openid_user_client_role_protocol_mapper" "PHO-RSC-Role-Groups" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  name                        = "PHO-RSC Role Groups"
  claim_name                  = "pho-rsc_role_groups"
  claim_value_type            = "String"
  add_to_access_token         = false
  add_to_userinfo             = false
  client_id_for_role_mappings = "PHO-RSC-GROUPS"
}
resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile"
  ]
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PHO-RSC-GROUPS/opho"       = var.PHO-RSC-GROUPS.ROLES["opho"].id,
    "PHO-RSC-GROUPS/hsiar_ppd"  = var.PHO-RSC-GROUPS.ROLES["hsiar_ppd"].id,
    "PHO-RSC-GROUPS/hsiar_dart" = var.PHO-RSC-GROUPS.ROLES["hsiar_dart"].id,
    "PHO-RSC-GROUPS/hsiar_wfa"  = var.PHO-RSC-GROUPS.ROLES["hsiar_wfa"].id,
    "PHO-RSC-GROUPS/hsiar_phar" = var.PHO-RSC-GROUPS.ROLES["hsiar_phar"].id,
  }
}
