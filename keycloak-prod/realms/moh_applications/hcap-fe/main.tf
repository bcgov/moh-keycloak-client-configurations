resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = "https://hcapemployers.dev.freshworks.club"
  client_authenticator_type           = "client-secret"
  client_id                           = "HCAP-FE"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HCAP"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris                 = []
  web_origins = [
    "*",
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "employer" = {
      "name" = "employer"
    },
    "health_authority" = {
      "name" = "health_authority"
    },
    "maximus" = {
      "name" = "maximus"
    },
    "ministry_of_health" = {
      "name" = "ministry_of_health"
    },
    "participant" = {
      "name" = "participant"
    },
    "pending" = {
      "name" = "pending"
    },
    "region_fraser" = {
      "name" = "region_fraser"
    },
    "region_interior" = {
      "name" = "region_interior"
    },
    "region_northern" = {
      "name" = "region_northern"
    },
    "region_vancouver_coastal" = {
      "name" = "region_vancouver_coastal"
    },
    "region_vancouver_island" = {
      "name" = "region_vancouver_island"
    },
    "superuser" = {
      "name" = "superuser"
    }
  }
}
