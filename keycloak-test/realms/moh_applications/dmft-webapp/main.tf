resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "DMFT-WEBAPP"
  consent_required                    = false
  description                         = "Driver Medical Fitness Transformation"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "DMFT"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://test.roadsafetybc.gov.bc.ca/",
    "https://localhost:*",
    "http://localhost:*",
    "https://pidp-adapter-0137d5-test.apps.silver.devops.gov.bc.ca/",
    "https://portal-ui-0137d5-test.apps.silver.devops.gov.bc.ca/",
    "https://rsbc-dfp-medical-portal-dev.silver.devops.bcgov/api",
    "https://oauth.pstmn.io/v1/callback",
    "https://medical-portal-pidp-0137d5-dev.apps.silver.devops.gov.bc.ca/*",
  ]
  web_origins = [
    "*",
  ]
}

resource "keycloak_openid_user_attribute_protocol_mapper" "pidp_email" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "pidp_email"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "pidp_email"
  user_attribute      = "pidp_email"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "DMFT_ENROLLED" = {
      "name"        = "DMFT_ENROLLED"
      "description" = ""
    }
  }
}

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"          = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER" = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
  }
}
