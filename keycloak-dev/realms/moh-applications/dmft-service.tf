resource "keycloak_openid_client" "DMFT-SERVICE" {
  realm_id              = "moh_applications"
  client_id             = "DMFT-SERVICE"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  standard_flow_enabled = true
  full_scope_allowed    = false
  valid_redirect_uris   = [
    "http://localhost:*",
    "https://localhost:*",
    "https://roadsafetybcportal-dev.apps.silver.devops.gov.bc.ca/rsbc-dfp-oidc/signin-oidc"
  ]
  web_origins = [
    "*"
  ]
}