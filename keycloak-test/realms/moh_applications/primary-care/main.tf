resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIMARY-CARE"
  consent_required                    = false
  description                         = "Primary Care"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Primary Care"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://healthbc--pmycareidp.sandbox.my.salesforce.com/*",
    "https://healthbc--pmycareidp.sandbox.my.site.com/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PRIMARY-CARE"
  name                        = "Client Role Mapper"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins"
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  optional_scopes = [
    "address",
    "microprofile-jwt",
    "offline_access",
    "phone"
  ]
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "TESTROLE1" = {
      "name"        = "TESTROLE1"
      "description" = ""
    },
    "TESTROLE2" = {
      "name"        = "TESTROLE2"
      "description" = ""
    },
    "Admin Support" = {
      "name"        = "Admin-Support"
      "description" = ""
    },
    "PRACTIONER" = {
      "name"        = "PRACTIONER"
      "description" = ""
    },
    "BCW Nurse" = {
      "name"        = "BCW-Nurse"
      "description" = ""
    },
  }
}
