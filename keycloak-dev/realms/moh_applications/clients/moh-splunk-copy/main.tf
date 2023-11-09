resource "keycloak_saml_client" "CLIENT" {
  realm_id                  = "moh_applications"
  client_id                 = "MOH_SPLUNK_COPY"
  name                      = "MOH_SPLUNK_COPY"
  description               = "This is a client to integrate with the OCIO's Splunk instance running against the HIVE. The HIVE is a centralized SIEM where we collect security related data to monitor and audit events occuring on MoH systems"
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
  full_scope_allowed        = false

  valid_redirect_uris = [
    "https://siem.secops.gov.bc.ca/*"
  ]
  base_url = "https://siem.secops.gov.bc.ca/"

  idp_initiated_sso_url_name          = "MOH_SPLUNK_COPY"
  assertion_consumer_redirect_url     = "https://siem.secops.gov.bc.ca/health/saml/acs"
  logout_service_redirect_binding_url = "https://siem.secops.gov.bc.ca/health/saml/logout"
}

resource "keycloak_role" "reportingadmin_role" {
  realm_id    = keycloak_saml_client.CLIENT.realm_id
  client_id   = keycloak_saml_client.CLIENT.id
  name        = "reportingadmin"
  description = "This is the role that maps to hlth_rw in the HIVE"
}

resource "keycloak_generic_client_role_mapper" "splunk_role_mapper" {
  realm_id  = keycloak_saml_client.CLIENT.realm_id
  client_id = keycloak_saml_client.CLIENT.id
  role_id   = keycloak_role.reportingadmin_role.id
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

resource "keycloak_generic_client_protocol_mapper" "role_list" {
  realm_id        = keycloak_saml_client.CLIENT.realm_id
  client_id       = keycloak_saml_client.CLIENT.id
  name            = "role list"
  protocol        = "saml"
  protocol_mapper = "saml-role-list-mapper"
  config = {
    "attribute.name"       = "role"
    "attribute.nameformat" = "Basic"
    "attribute.value"      = "value"
    "friendly.name"        = "role"
  }
}
