resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "EDRD"
  consent_required                    = false
  description                         = "Expensive Drugs for Rare Disease"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "EDRD"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bchealth--edrduat.sandbox.my.salesforce.com/*",
    "https://bchealth--edrduat.sandbox.my.site.com/*",
    "https://bchealth--edrddev.sandbox.my.site.com/edrdportal/*",
    "bchealth--edrddev.sandbox.my.salesforce.com/*",
    "bchealth--edrdqa.sandbox.my.salesforce.com/*",
    "https://bchealth--edrdqa.sandbox.my.site.com/edrdportalQA/*",
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "EDRD_Admin" = {
      "name" = "EDRD_Admin"
    },
    "EDRD_Staff" = {
      "name" = "EDRD_Staff"
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
  client_id_for_role_mappings = "EDRD"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}
