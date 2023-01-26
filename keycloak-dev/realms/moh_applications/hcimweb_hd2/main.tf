resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://hcimwebdev-hd2.hlth.gov.bc.ca/HCIMWeb"
  client_authenticator_type           = "client-secret"
  client_id                           = "HCIMWEB_HD2"
  consent_required                    = false
  description                         = "The Healthcare Client Identity Management Web Application provides a web interface to the HCIM system services, allowing point-of-service users to find, add or update health clients, view documented identity and confirm eligibility."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  login_theme                         = "moh-app-realm-bcsc-idp"
  name                                = "HCIMWEB_HD2"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://localhost:8081/*",
    "https://hcimwebdev-hd2.hlth.gov.bc.ca/HCIMWeb/*",
    "https://sts.healthbc.org/adfs/ls/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HIBC_REG_NEWBORN" = {
      "name" = "HIBC_REG_NEWBORN"
    },
    "MAINTR_FULL" = {
      "name" = "MAINTR_FULL"
    },
    "MAINTR_READ_ONLY" = {
      "name" = "MAINTR_READ_ONLY"
    },
    "MAINTR_UPDT" = {
      "name" = "MAINTR_UPDT"
    },
    "READ_ONLY_ALL_SRC" = {
      "name" = "READ_ONLY_ALL_SRC"
    },
    "REGR_FULL" = {
      "name" = "REGR_FULL"
    },
    "REGR_LTD" = {
      "name" = "REGR_LTD"
    },
    "REGR_UPDT" = {
      "name" = "REGR_UPDT"
    },
    "REGR_UPDT_ADDR_ONLY" = {
      "name" = "REGR_UPDT_ADDR_ONLY"
    },
    "REG_ADMIN_HCIM" = {
      "name" = "REG_ADMIN_HCIM"
    },
    "REG_INTEGRITY_CLERK" = {
      "name" = "REG_INTEGRITY_CLERK"
    },
  }
}
resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = false
  add_to_userinfo             = false
  claim_name                  = "hcimweb_role"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = keycloak_openid_client.CLIENT.id
  multivalued                 = true
  name                        = "HCIMWEB Role"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "org_details" {
  add_to_id_token = false
  add_to_userinfo = false
  claim_name      = "org_details"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "org_details"
  user_attribute  = "org_details"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "IDP"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}
