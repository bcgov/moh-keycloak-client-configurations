resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://metadev.healthideas.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "METASPACE"
  consent_required                    = false
  description                         = "Healthideas Metaspace is the metadata repository for the Ministry of Health's enterprise data warehouse (Healthideas)."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "METASPACE"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://metaspace.ddev.site/*",
    "https://metadev.healthideas.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://qa-sts.healthbc.org/adfs/ls/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "IDP"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_company" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "idir_company"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_company"
  user_attribute  = "idir_company"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_mailboxOrgCode" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "idir_mailboxOrgCode"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_mailboxOrgCode"
  user_attribute  = "idir_mailboxOrgCode"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "bceid_business_legalName" {
  add_to_id_token = true
  add_to_userinfo = false
  claim_name      = "bceid_business_legalName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bceid_business_legalName"
  user_attribute  = "bceid_business_legalName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins",

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
