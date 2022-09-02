resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "MAID"
  consent_required                    = false
  description                         = "Medical Assistance in Dying"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "MAiD Case Management"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcmohmaid--maiduat.my.salesforce.com/*",
    "https://bcmohmaid--maidqa.my.salesforce.com/*",
    "https://healthbc--pmycareidp.sandbox.my.site.com/*",
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "MAiD-Analyst" = {
      "name"        = "MAiD-Analyst"
     },
    "MAiD-Manager-1" = {
      "name"        = "MAiD-Manager-1"
      },
    "MAiD-Manager-2" = {
      "name"        = "MAiD-Manager-2"
      },
    "MAiD-Manager-3" = {
      "name"        = "MAiD-Manager-3"
      },
    "MAiD-Manager-4" = {
      "name"        = "MAiD-Manager-4"
      },
    "MAiD-System-Administrator" = {
      "name"        = "MAiD-System-Administrator"
      },
  }
}
resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "MAID"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
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
