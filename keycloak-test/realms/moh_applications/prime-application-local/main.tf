resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIME-APPLICATION-LOCAL"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "*"
  ]
  web_origins = [
    "*",
  ]
}

resource "keycloak_openid_audience_protocol_mapper" "prime-web-api" {
  add_to_id_token          = false
  client_id                = keycloak_openid_client.CLIENT.id
  included_custom_audience = "prime-web-api"
  name                     = "prime-web-api"
  realm_id                 = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token = false
  claim_name      = "identity_provider"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "IDP"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
  session_note    = "identity_provider"
}

resource "keycloak_openid_user_attribute_protocol_mapper" "bcsc_guid" {
  add_to_id_token = true
  claim_name      = "bcsc_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bcsc_guid"
  user_attribute  = "bcsc_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "identity_assurance_level" {
  add_to_id_token = true
  claim_name      = "identity_assurance_level"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "identity_assurance_level"
  user_attribute  = "identity_assurance_level"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "enrollee_approve" = {
      "name" = "enrollee_approve"
    },
    "enrollee_triage" = {
      "name" = "enrollee_triage"
    },
    "enrollee_view" = {
      "name" = "enrollee_view"
    },
    "enrollee_elevated_management" = {
      "name" = "enrollee_elevated_management"
    },
    "site_edit" = {
      "name" = "site_edit"
    },
    "site_view" = {
      "name" = "site_view"
    },
    "paper_enrolment_only_edit" = {
      "name" = "paper_enrolment_only_edit"
    },
    "paper_enrolment_only_view" = {
      "name" = "paper_enrolment_only_view"
    },
    "prime_administrant" = {
      "name" = "prime_administrant"
    },
    "prime_super_admin" = {
      "name" = "prime_super_admin"
    },
    "prime_maintenance" = {
      "name" = "prime_maintenance"
    },
    "prime_user" = {
      "name" = "prime_user"
    },
    "external_gpid_validation" = {
      "name" = "external_gpid_validation"
    },
    "external_hpdid_access" = {
      "name" = "external_hpdid_access"
    },
    "prime_api_service_account" = {
      "name" = "prime_api_service_account"
    },
  }
}
