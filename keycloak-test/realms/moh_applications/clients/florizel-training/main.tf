resource "keycloak_saml_client" "CLIENT" {
  realm_id                  = "moh_applications"
  client_id                 = "FLORIZEL-TRAINING"
  name                      = "FLORIZEL TRAINING"
  description               = "A health management platform providing medical triage services - training environment"
  enabled                   = true
  include_authn_statement   = true
  sign_documents            = true
  sign_assertions           = false
  signature_algorithm       = "RSA_SHA256"
  signature_key_name        = "NONE"
  canonicalization_method   = "EXCLUSIVE"
  encrypt_assertions        = false
  client_signature_required = false
  force_post_binding        = true
  front_channel_logout      = true
  force_name_id_format      = true
  name_id_format            = "persistent"
  full_scope_allowed        = false
  login_theme               = "idir_aad"

  valid_redirect_uris = [
    "https://hlbc-training.fonemedhms.com/*",
  ]
  base_url = "https://hlbc-training.fonemedhms.com"

  assertion_consumer_redirect_url = "https://hlbc-training.fonemedhms.com/adminusers/auth/saml/callback"
  assertion_consumer_post_url     = "https://hlbc-training.fonemedhms.com/adminusers/auth/saml/callback"
}


resource "keycloak_saml_user_property_protocol_mapper" "saml_user_email_mapper" {
  realm_id                   = keycloak_saml_client.CLIENT.realm_id
  client_id                  = keycloak_saml_client.CLIENT.id
  name                       = "email"
  user_property              = "email"
  saml_attribute_name        = "email"
  friendly_name              = "email"
  saml_attribute_name_format = "Basic"
}

resource "keycloak_saml_user_property_protocol_mapper" "saml_user_last_name_mapper" {
  realm_id                   = keycloak_saml_client.CLIENT.realm_id
  client_id                  = keycloak_saml_client.CLIENT.id
  name                       = "lastName"
  user_property              = "lastName"
  saml_attribute_name        = "lastName"
  friendly_name              = "lastName"
  saml_attribute_name_format = "Basic"
}

resource "keycloak_saml_user_property_protocol_mapper" "saml_user_first_name_mapper" {
  realm_id                   = keycloak_saml_client.CLIENT.realm_id
  client_id                  = keycloak_saml_client.CLIENT.id
  name                       = "firstName"
  user_property              = "firstName"
  saml_attribute_name        = "firstName"
  friendly_name              = "firstName"
  saml_attribute_name_format = "Basic"
}

resource "keycloak_generic_client_protocol_mapper" "saml_role_list_mapper" {
  realm_id        = keycloak_saml_client.CLIENT.realm_id
  client_id       = keycloak_saml_client.CLIENT.id
  name            = "role list"
  protocol        = "saml"
  protocol_mapper = "saml-role-list-mapper"
  config = {
    "attribute.name"       = "Role"
    "attribute.nameformat" = "Basic"
    "friendly.name"        = "Role"
    "single"               = "true"
  }
}

resource "keycloak_role" "HealthlinkBC_IssueManager" {
  realm_id    = keycloak_saml_client.CLIENT.realm_id
  client_id   = keycloak_saml_client.CLIENT.id
  name        = "HealthlinkBC_IssueManager"
  description = "Equivalent of Systems Administrator"
}

resource "keycloak_role" "HealthlinkBC_Nurse" {
  realm_id    = keycloak_saml_client.CLIENT.realm_id
  client_id   = keycloak_saml_client.CLIENT.id
  name        = "HealthlinkBC_Nurse"
  description = "Equivalent of Clinical"
}

resource "keycloak_role" "HealthlinkBC_NurseLead" {
  realm_id    = keycloak_saml_client.CLIENT.realm_id
  client_id   = keycloak_saml_client.CLIENT.id
  name        = "HealthlinkBC_NurseLead"
  description = "Equivalent of Clinical Manager"
}