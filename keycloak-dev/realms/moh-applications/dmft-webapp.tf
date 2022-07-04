resource "keycloak_openid_client" "DMFT-WEBAPP" {
  realm_id                   = "moh_applications"
  client_id                  = "DMFT-WEBAPP"
  name                       = "DMFT"
  enabled                    = true
  access_type                = "PUBLIC"
  standard_flow_enabled      = true
  full_scope_allowed         = false
  pkce_code_challenge_method = "S256"
  valid_redirect_uris        = [
    "*"
  ]
  web_origins = [
    "*"
  ]
}