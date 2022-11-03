resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan      = ""
  access_type                = "PUBLIC"
  client_authenticator_type  = "client-secret"
  client_id                  = "PRP-WEB"
  description                = "Provider Reporting Portal Frontend"
  full_scope_allowed         = false
  name                       = "PRP Web"
  pkce_code_challenge_method = "S256"
  realm_id                   = "moh_applications"
  standard_flow_enabled      = true
  valid_redirect_uris = [
    "http://localhost:*",
  ]
  web_origins = [
    "*",
  ]
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

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PRP-SERVICE/ADMIN" = var.PRP-SERVICE.ROLES["ADMIN"].id,
    "PRP-SERVICE/PMP"   = var.PRP-SERVICE.ROLES["PMP"].id,
    "PRP-SERVICE/MSPQI" = var.PRP-SERVICE.ROLES["MSPQI"].id,
  }
}
