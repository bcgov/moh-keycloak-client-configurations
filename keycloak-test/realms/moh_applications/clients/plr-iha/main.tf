resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "28800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PLR-IHA"
  consent_required                    = false
  description                         = "This service account is used for accessing the Provider and Location Registry (PLR) which is a standards-based repository of core provider data supplied by authorized sources that facilitates the formal exchange of health information."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PLR-IHA"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}
resource "keycloak_openid_hardcoded_claim_protocol_mapper" "orgId" {
  add_to_access_token = true
  add_to_id_token     = true
  add_to_userinfo     = true
  claim_name          = "orgId"
  claim_value         = "00014478"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "orgId"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}
module "service-account-roles" {
  source                  = "../../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "PLR_REV/CONSUMER" = {
      "client_id" = var.PLR_REV.CLIENT.id,
      "role_id"   = "CONSUMER"
    },
    "PLR_IAT/CONSUMER" = {
      "client_id" = var.PLR_IAT.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
  }
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PLR_REV/CONSUMER" = var.PLR_REV.ROLES["CONSUMER"].id,
    "PLR_IAT/CONSUMER" = var.PLR_IAT.ROLES["CONSUMER"].id
  }
}