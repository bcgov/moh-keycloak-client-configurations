resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HEALTH-IDEAS"
  consent_required                    = false
  description                         = "HealthIdeas Reporting Application"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HEALTH-IDEAS"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://devsecure.healthideas.gov.bc.ca/*",
    "https://uatsecure.healthideas.gov.bc.ca/*",
    "https://devsecuret.healthideas.gov.bc.ca/*",
    "https://uatsecuret.healthideas.gov.bc.ca/*",
    "https://uatexternal.healthideas.gov.bc.ca/*",
    "https://uatexternalt.healthideas.gov.bc.ca/*"
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
  client_id_for_role_mappings = "HEALTH-IDEAS"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "REPORTS_ADMIN_DEV" = {
      "name" = "REPORTS_ADMIN_DEV"
    },
    "REPORTS_ADMIN_UAT" = {
      "name" = "REPORTS_ADMIN_UAT"
    }
  }
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_username" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_username"
  user_attribute  = "idir_username"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}