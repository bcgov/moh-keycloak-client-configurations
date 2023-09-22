resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "TBCM"
  consent_required                    = false
  description                         = "Team Based Care Manager. The application allows team leads to plan out shift assignments for health care workers."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "TBCM"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://dev.tbcm.freshworks.club/*",
    "http://localhost:3000/*",
    "https://d3qshnmydybt5m.cloudfront.net/*",
    "https://test.tbcm.freshworks.club/*",
    "https://d1xxd26qe80lqw.cloudfront.net/*",
  ]
  web_origins = [
  ]
}