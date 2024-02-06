resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PHLAT"
  consent_required                    = false
  description                         = "PLR Health Service Delivery Site Data Load Assistant Tool"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PHLAT"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://d2llaidph43whp.cloudfront.net/app/*",
    "https://localhost:*",
    "http://localhost:*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-PHLAT" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PHLAT"
  name                        = "PHLAT Role Mapper"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "REG_USER" : {
      "name" : "REG_USER",
    },
    "REG_ADMIN" : {
      "name" : "REG_ADMIN",
    },
  }
}
