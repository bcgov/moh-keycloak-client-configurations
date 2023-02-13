resource "keycloak_saml_client" "CLIENT" {
  realm_id                  = "moh_applications"
  client_id                 = "HHSLibrary"
  name                      = "HHSLibrary"
  description               = "EZproxy is a web proxy server used by the Health and Human Services library to give access from outside the library's computer network to restricted-access websites that authenticate users by IP address."
  enabled                   = true
  include_authn_statement   = true
  sign_documents            = true
  sign_assertions           = true
  signature_algorithm       = "RSA_SHA256"
  signature_key_name        = "KEY_ID"
  canonicalization_method   = "EXCLUSIVE"
  encrypt_assertions        = false
  client_signature_required = false
  force_post_binding        = true
  front_channel_logout      = true
  force_name_id_format      = false
  name_id_format            = "username"

  valid_redirect_uris = [
    "https://login.ezproxy.hlth.gov.bc.ca/Shibboleth.sso/SAML2/Artifact",
    "https://login.ezproxy.hlth.gov.bc.ca/*",
    "https://login.ezproxy.hlth.gov.bc.ca/Shibboleth.sso/SAML2/POST*"
  ]
  base_url = "https://login.ezproxy.hlth.gov.bc.ca"

  idp_initiated_sso_url_name          = "ezproxy"
  assertion_consumer_post_url         = "https://login.ezproxy.hlth.gov.bc.ca/Shibboleth.sso/SAML2/POST"
  logout_service_post_binding_url     = "https://login.ezproxy.hlth.gov.bc.ca/Shibboleth.sso/SAML2/SLO/POST"
  logout_service_redirect_binding_url = "https://login.ezproxy.hlth.gov.bc.ca/Shibboleth.sso/SAML2/SLO/Redirect"
}

resource "keycloak_saml_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_saml_client.CLIENT.realm_id
  client_id = keycloak_saml_client.CLIENT.id

  default_scopes = [
    "role_list"
  ]
}

resource "keycloak_saml_user_attribute_protocol_mapper" "bceid_business_id" {
  realm_id  = keycloak_saml_client.CLIENT.realm_id
  client_id = keycloak_saml_client.CLIENT.id
  name      = "bceid_business_id"

  user_attribute             = "bceid_business_id"
  saml_attribute_name        = "bceid_business_id"
  saml_attribute_name_format = "Basic"
  friendly_name              = "bceid_business_id"
}

resource "keycloak_saml_user_attribute_protocol_mapper" "idir_company" {
  realm_id  = keycloak_saml_client.CLIENT.realm_id
  client_id = keycloak_saml_client.CLIENT.id
  name      = "idir_company"

  user_attribute             = "idir_company"
  saml_attribute_name        = "idir_company"
  saml_attribute_name_format = "Basic"
  friendly_name              = "idir_company"
}
