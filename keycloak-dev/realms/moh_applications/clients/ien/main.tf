resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "IEN"
  consent_required                    = false
  description                         = "Internationally Educated Nurses"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "IEN"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://dev.ien.freshworks.club/*",
  ]
  web_origins = [
    "*",
  ]
  authentication_flow_binding_overrides {
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "ha" = {
      "name" = "ha"
    },
    "hmbc" = {
      "name" = "hmbc"
    },
    "moh" = {
      "name" = "moh"
    },
    "pending" = {
      "name" = "pending"
    },
  }
}
resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "bceid_business",
    "bcprovider_aad",
    "fnha_aad",
    "idir_aad",
    "moh_idp",
    "phsa",
    "phsa_aad",
    "email",
    "profile",
    "roles",
    "web-origins",
    "basic"
  ]
}
