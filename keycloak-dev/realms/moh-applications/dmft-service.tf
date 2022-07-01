resource "keycloak_openid_client" "DMFT-SERVICE" {
  realm_id                 = "moh_applications"
  client_id                = "DMFT-SERVICE"
  name                     = "DMFT"
  enabled                  = true
  access_type              = "CONFIDENTIAL"
  standard_flow_enabled    = true
  service_accounts_enabled = true
  full_scope_allowed       = false
  valid_redirect_uris      = [
    "*"
  ]
  web_origins = [
    "*"
  ]
}