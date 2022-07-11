resource "keycloak_openid_client" "PIDP-SERVICE" {
  realm_id                 = "moh_applications"
  client_id                = "PIDP-SERVICE"
  enabled                  = true
  access_type              = "CONFIDENTIAL"
  service_accounts_enabled = true

  backchannel_logout_session_required = false
  full_scope_allowed = false
  use_refresh_tokens = false
  access_token_lifespan = 300
  exclude_session_state_from_auth_response = false
}

resource "keycloak_openid_client_service_account_role" "PIDP-SERVICE_view-client-uci-sso_service_account_role" {
  realm_id                = keycloak_openid_client.PIDP-SERVICE.realm_id
  service_account_user_id = keycloak_openid_client.PIDP-SERVICE.service_account_user_id
  client_id               = keycloak_openid_client.USER-MANAGEMENT-SERVICE.id
  role                    = keycloak_role.UMS_role_view-client-uci-sso.name
}

resource "keycloak_generic_client_role_mapper" "PIDP-SERVICE_ums_view-client-uci-sso_client_role_mapper" {
  realm_id  = keycloak_openid_client.PIDP-SERVICE.realm_id
  client_id = keycloak_openid_client.PIDP-SERVICE.id
  role_id   = keycloak_role.UMS_role_view-client-uci-sso.id
}
