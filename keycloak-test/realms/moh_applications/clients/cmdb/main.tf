resource "keycloak_openid_client" "CMDB" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "CMDB"
  consent_required                    = false
  description                         = "Configuration Management Database (CMDB) is a database for with a COTS front end for tracking MoH Software Assets"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "CMDB"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://localhost:8444/*",
    "https://cmdbt.hlth.gov.bc.ca/*",
    "https://cmdb.ynr9ed-test.nimbus.cloud.gov.bc.ca/*"
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    #browser-idp-restriction flow
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}
resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CMDB.realm_id
  client_id = keycloak_openid_client.CMDB.id
  default_scopes = [
    "idir",
    "idir_aad",
    "email",
    "profile",
    "roles",
    "web-origins"
  ]
}