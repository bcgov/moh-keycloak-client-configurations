terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 3.0.0"
    }
  }
}

resource "keycloak_openid_client" "realm-management" {
  access_type                                = "BEARER-ONLY"
  backchannel_logout_revoke_offline_sessions = false
  backchannel_logout_session_required        = false
  client_authenticator_type                  = "client-secret"
  client_id                                  = "realm-management"
  consent_required                           = false
  direct_access_grants_enabled               = false
  display_on_consent_screen                  = false
  enabled                                    = true
  extra_config                               = {}
  frontchannel_logout_enabled                = false
  full_scope_allowed                         = false
  implicit_flow_enabled                      = false
  name                                       = "Realm Management"
  oauth2_device_authorization_grant_enabled  = false
  realm_id                                   = "moh_applications"
  service_accounts_enabled                   = false
  standard_flow_enabled                      = true
  use_refresh_tokens                         = false
  valid_redirect_uris                        = []
  web_origins                                = []
}

resource "keycloak_role" "realm-management_role_manage-users" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "manage-users"
  description = format("%s%s","$","{role_manage-users}")
}

resource "keycloak_role" "realm-management_role_view-clients" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "view-clients"
  description = format("%s%s","$","{role_view-clients}")
  composite_roles = [
    keycloak_role.realm-management_role_query-clients.id,
  ]
}

resource "keycloak_role" "realm-management_role_view-users" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "view-users"
  description = format("%s%s","$","{role_view-users}")
  composite_roles = [
    keycloak_role.realm-management_role_query-groups.id,
    keycloak_role.realm-management_role_query-users.id,
  ]
}

resource "keycloak_role" "realm-management_role_view-events" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "view-events"
  description = format("%s%s","$","{role_view-events}")

}

resource "keycloak_role" "realm-management_role_query-clients" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "query-clients"
  description = format("%s%s","$","{role_query-clients}")

}

resource "keycloak_role" "realm-management_role_query-users" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "query-users"
  description = format("%s%s","$","{role_query-users}")

}

resource "keycloak_role" "realm-management_role_query-groups" {
  realm_id    = keycloak_openid_client.realm-management.realm_id
  client_id   = keycloak_openid_client.realm-management.id
  name    = "query-groups"
  description = format("%s%s","$","{role_query-groups}")

}