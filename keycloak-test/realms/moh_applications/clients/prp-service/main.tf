resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan      = ""
  access_type                = "BEARER-ONLY"
  client_authenticator_type  = "client-secret"
  client_id                  = "PRP-SERVICE"
  description                = "Provider Reporting Portal Backend"
  full_scope_allowed         = false
  name                       = "PRP API"
  pkce_code_challenge_method = ""
  realm_id                   = "moh_applications"
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
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
    "Mspqi" = {
      "name" = "Mspqi"
    },
    "Pharmacist" = {
      "name" = "Pharmacist"
    },
    "Physician" = {
      "name" = "Physician"
    },
    "Pmp" = {
      "name" = "Pmp"
    },
    "PRP_MSPQI" = {
      "name" = "PRP_MSPQI"
    },
    "PRP_PMP" = {
      "name" = "PRP_PMP"
    },
    "PRP_ReportProgram_MSPQI" = {
      "name" = "PRP_ReportProgram_MSPQI"
    },
    "PRP_ReportSection_MSPQI" = {
      "name" = "PRP_ReportSection_MSPQI"
    },
    "PRP_ReportProgram_PMP" = {
      "name" = "PRP_ReportProgram_PMP"
    },
    "PRP_ReportSection_PMP" = {
      "name" = "PRP_ReportSection_PMP"
    },
  }
}
