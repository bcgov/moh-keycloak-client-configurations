resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://www-dev.healthlinkbc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "HLBC"
  consent_required                    = false
  description                         = "HealthlinkBC is an informational website for the public. They can search for health-related questions on the site. The site is managed by HLBC users with different roles."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HLBC"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  valid_redirect_uris = [
    "https://fusion.ddev.site/*",
    "https://www-dev.healthlinkbc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "ANONYMOUS_USER" = {
      "name" = "ANONYMOUS_USER"
    },
    "AUTHENTICATED_USER" = {
      "name" = "AUTHENTICATED_USER"
    },
    "SITE_ADMINISTRATOR" = {
      "name" = "SITE_ADMINISTRATOR"
    },
    "CONTENT_ADMINISTRATOR" = {
      "name" = "CONTENT_ADMINISTRATOR"
    },
    "CONTENT_EDITOR" = {
      "name" = "CONTENT_EDITOR"
    },
    "CONTENT_CONTRIBUTOR" = {
      "name" = "CONTENT_CONTRIBUTOR"
    },
    "DEVELOPER" = {
      "name" = "DEVELOPER"
    },
    "DIGITAL_ANALYST" = {
      "name" = "DIGITAL_ANALYST"
    },
    "CLINICAL" = {
      "name" = "CLINICAL"
    },
    "DATA_STEWARD" = {
      "name" = "DATA_STEWARD"
    },
  }
}