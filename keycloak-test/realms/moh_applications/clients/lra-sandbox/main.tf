resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "LRA-SANDBOX"
  consent_required                    = false
  description                         = "Longitudinal Record Access. Sandbox Environment. LRA is a FHIR Server to access Longitudinal Health Records."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "LRA-SANDBOX"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
  ]
  web_origins = [
  ]
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