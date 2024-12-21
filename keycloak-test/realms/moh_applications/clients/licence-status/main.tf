# This is not a typical client or REST API. It is used as a "role holder" to share roles between clients that need to know the licence status of a user.
resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "BEARER-ONLY"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "LICENCE-STATUS"
  consent_required                    = false
  description                         = "Created for DMFT and PIDP to hold licence status roles."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = false
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "MOA" = {
      "name"        = "MOA"
      "description" = ""
    },
    "PRACTITIONER" = {
      "name"        = "PRACTITIONER"
      "description" = ""
    },
    "MD" = {
      "name"        = "MD"
      "description" = ""
    },
    "RNP" = {
      "name"        = "RNP"
      "description" = ""
    },
    "PHARM" = {
      "name"        = "PHARM"
      "description" = ""
    },
  }
}
