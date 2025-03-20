resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIME-APPLICATION-SERVICE-ACCOUNT"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
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

resource "keycloak_openid_audience_protocol_mapper" "Prime-Audience-Mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_custom_audience = "prime-web-api"
  name                     = "Prime Audience Mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
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
    "PRIME-APPLICATION-LOCAL/prime_api_service_account" = {
      "client_id" = var.PRIME-APPLICATION-LOCAL.CLIENT.id,
      "role_id"   = "prime_api_service_account"
    }
    "PRIME-APPLICATION-TEST/prime_api_service_account" = {
      "client_id" = var.PRIME-APPLICATION-TEST.CLIENT.id,
      "role_id"   = "prime_api_service_account"
    }
  }
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PRIME-APPLICATION-LOCAL/prime_api_service_account" = var.PRIME-APPLICATION-LOCAL.ROLES["prime_api_service_account"].id,
    "PRIME-APPLICATION-TEST/prime_api_service_account"  = var.PRIME-APPLICATION-TEST.ROLES["prime_api_service_account"].id
  }
}
