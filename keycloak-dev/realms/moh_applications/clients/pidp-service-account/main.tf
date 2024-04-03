resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PIDP-SERVICE-ACCOUNT"
  consent_required                    = false
  description                         = "Service account for Provider Identity Portal. Authorizes internal maintenance endpoint calls"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PIDP Service Account"
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

resource "keycloak_openid_audience_protocol_mapper" "PIDP-SERVICE-aud-mapper" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_client_audience = "PIDP-SERVICE"
  name                     = "PIDP-SERVICE aud mapper"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "resource_access.PIDP-SERVICE.roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PIDP-SERVICE-ACCOUNT"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "service_account" = {
      "name" = "service_account"
    },
  }
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
    "PIDP-SERVICE-ACCOUNT/service_account" = {
      "client_id" = keycloak_openid_client.CLIENT.id,
      "role_id"   = "service_account"
    }
  }
}
resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "preferred_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "phsa_windowsaccoutname"
  user_attribute  = "phsa_windowsaccoutname"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
