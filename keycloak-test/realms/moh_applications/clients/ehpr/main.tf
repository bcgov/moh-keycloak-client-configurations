resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "EHPR"
  consent_required                    = false
  description                         = "Emergency Health Provider Registry. Health workers can sign up at https://ehpr.gov.bc.ca/. In times of flood, earthquake, or wildfire, registrants may be called up to help."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "EHPR"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://dev.ehpr.freshworks.club/*",
    "https://test.ehpr.freshworks.club/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
    "http://localhost:3000/*",
  ]
  web_origins = [
    "+"
  ]
}