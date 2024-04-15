resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "BEARER-ONLY"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PHO-RSC-GROUPS"
  consent_required                    = false
  description                         = "PHO RStudio Connect Analytics Platform team groups, which are used for organizing users of the platform according to their respective teams. "
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "PHO RStudio Connect - Team Groups"
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
    "opho" = {
      "name"        = "opho"
      "description" = ""
    },
    "hsiar_ppd" = {
      "name"        = "hsiar_ppd"
      "description" = ""
    },
    "hsiar_dart" = {
      "name"        = "hsiar_dart"
      "description" = ""
    },
    "hsiar_wfa" = {
      "name"        = "hsiar_wfa"
      "description" = ""
    },
    "hsiar_phar" = {
      "name"        = "hsiar_phar"
      "description" = ""
    }
  }
}
