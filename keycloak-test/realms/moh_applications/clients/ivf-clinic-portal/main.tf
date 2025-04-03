resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "IVF-CLINIC-PORTAL"
  consent_required                    = false
  description                         = "IVF Portal is an application management system to effectively handle IVF application volumes. This client is dedicated for clinic personel."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "IVF Clinic Portal"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcministryofhealth-ivfportal--ivfdev.sandbox.my.site.com/*",
    "https://bcministryofhealth-ivfportal--ivfqa.sandbox.my.site.com/*",
    "https://bcministryofhealth-ivfportal--ivfuat.sandbox.my.site.com/*"
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-IVF-CLINIC" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "IVF-CLINIC-PORTAL"
  name                        = "Client Role Mapper for IVF-CLINIC"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}


resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token     = true
  add_to_access_token = true
  claim_name          = "identity_provider"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "IDP"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
  session_note        = "identity_provider"
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "clinic-admin" = {
      "name"        = "clinic-admin"
      "description" = ""
    }
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "bcprovider_aad",
    "idir_aad",
    "profile",
    "email",
    "basic"
  ]
}

resource "keycloak_openid_user_attribute_protocol_mapper" "endorser_data" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "endorser_data"
  claim_value_type    = "JSON"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "endorser_data"
  user_attribute      = "endorser_data"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "cpn" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "common_provider_number"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "cpn"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-LICENCE-STATUS" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "LICENCE-STATUS"
  name                        = "Client Role Mapper for LICENCE-STATUS"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"          = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER" = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD"           = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP"          = var.LICENCE-STATUS.ROLES["RNP"].id
  }
}
