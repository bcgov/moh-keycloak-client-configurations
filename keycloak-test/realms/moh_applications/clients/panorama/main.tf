resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan        = ""
  access_type                  = "CONFIDENTIAL"
  base_url                     = ""
  client_authenticator_type    = "client-secret"
  client_id                    = "PANORAMA"
  consent_required             = false
  description                  = "An eHealth system that allows authorized public health care providers to document and securely store all public health services and care programs in BC and Yukon."
  direct_access_grants_enabled = false
  enabled                      = true
  frontchannel_logout_enabled  = false
  full_scope_allowed           = false
  implicit_flow_enabled        = false
  name                         = "Panorama"
  pkce_code_challenge_method   = ""
  realm_id                     = "moh_applications"
  service_accounts_enabled     = false
  standard_flow_enabled        = true
  valid_redirect_uris = [
    "*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "identity_provider"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "identity_provider"
}

resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "preferred_username"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "phsa_windowsaccoutname"
  user_attribute  = "phsa_windowsaccoutname"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccoutname" {
add_to_id_token = true
add_to_userinfo = true
claim_name      = "preferred_username"
client_id       = keycloak_openid_client.CLIENT.id
name            = "phsa_windowsaccoutname"
user_attribute  = "phsa_windowsaccoutname"
realm_id        = keycloak_openid_client.CLIENT.realm_id
}
