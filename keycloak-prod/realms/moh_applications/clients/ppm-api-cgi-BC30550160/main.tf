resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "ppm-api-cgi-BC30550160"
  consent_required                    = false
  description                         = "Client for testing the production environments during the PPM API application's development."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PPM API CGI BC30550160"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
  add_to_id_token  = true
  claim_name       = "clientHost"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client Host"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientHost"
}

resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
  add_to_id_token  = true
  claim_name       = "clientId"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client ID"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientId"
}

resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
  add_to_id_token  = true
  claim_name       = "clientAddress"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client IP Address"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientAddress"
}

resource "keycloak_openid_user_session_note_protocol_mapper" "Pharmanet-Audience" {
  add_to_id_token  = false
  claim_name       = "pharmanet"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Pharmanet Audience"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "pharmanet"
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  optional_scopes = [
    "system/*.read",
    "system/*.write",
    "system/Claim.read",
    "system/Claim.write",
    "system/Consent.read",
    "system/Consent.write",
    "system/Location.read",
    "system/Medication.read",
    "system/MedicationDispense.read",
    "system/MedicationDispense.write",
    "system/MedicationRequest.read",
    "system/MedicationRequest.write",
    "system/MedicationStatement.read",
    "system/MedicationStatement.write",
    "system/Patient.read",
    "system/Patient.write",
    "system/Practitioner.read",
  ]
}
