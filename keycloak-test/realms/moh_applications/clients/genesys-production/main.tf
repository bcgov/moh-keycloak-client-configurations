resource "keycloak_saml_client" "CLIENT" {
  realm_id                  = "moh_applications"
  client_id                 = "GENESYS-PRODUCTION"
  name                      = "GENESYS PRODUCTION"
  description               = "Contact Center as a Service (CCaaS) Genesys CX Cloud contact center solution. Production environment. Temporarily connected to Keycloak Test instance."
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
  force_name_id_format      = false
  name_id_format            = "persistent"
  full_scope_allowed        = false
  login_theme               = "idir_aad-phsa-bcprovider"

  valid_redirect_uris = [
    "https://login.cac1.pure.cloud/*",
    "https://apps.cac1.pure.cloud/*"
  ]
  base_url = "https://apps.cac1.pure.cloud/"

  assertion_consumer_redirect_url     = "https://login.cac1.pure.cloud/saml"
  assertion_consumer_post_url         = "https://login.cac1.pure.cloud/saml"
  logout_service_redirect_binding_url = "https://login.cac1.pure.cloud/saml/logout"
  logout_service_post_binding_url     = "https://login.cac1.pure.cloud/saml/logout"
}

#custom claim used to redirect to "apps" page instead of the "splash" screen
resource "keycloak_generic_client_protocol_mapper" "saml_service_name_mapper" {
  realm_id        = keycloak_saml_client.CLIENT.realm_id
  client_id       = keycloak_saml_client.CLIENT.id
  name            = "ServiceName"
  protocol        = "saml"
  protocol_mapper = "saml-hardcode-attribute-mapper"
  config = {
    "attribute.name"       = "ServiceName"
    "attribute.nameformat" = "Basic"
    "attribute.value"      = "directory"
    "friendly.name"        = "ServiceName"
  }
}

resource "keycloak_generic_client_protocol_mapper" "saml_hardcoded_attribute_mapper" {
  realm_id        = keycloak_saml_client.CLIENT.realm_id
  client_id       = keycloak_saml_client.CLIENT.id
  name            = "OrganizationName"
  protocol        = "saml"
  protocol_mapper = "saml-hardcode-attribute-mapper"
  config = {
    "attribute.name"       = "OrganizationName"
    "attribute.nameformat" = "Basic"
    "attribute.value"      = "hlbc-prod"
    "friendly.name"        = "OrganizationName"
  }
}

resource "keycloak_saml_user_attribute_protocol_mapper" "saml_user_attribute_mapper" {
  realm_id                   = keycloak_saml_client.CLIENT.realm_id
  client_id                  = keycloak_saml_client.CLIENT.id
  name                       = "email"
  user_attribute             = "email"
  saml_attribute_name        = "email"
  friendly_name              = "email"
  saml_attribute_name_format = "Basic"
}
