resource "keycloak_openid_client" "USER-MANAGEMENT" {
  access_type                                = "PUBLIC"
  admin_url                                  = "https://common-logon-dev.hlth.gov.bc.ca/webapp"
  backchannel_logout_revoke_offline_sessions = false
  backchannel_logout_session_required        = false
  base_url                                   = "https://common-logon-dev.hlth.gov.bc.ca/webapp"
  client_authenticator_type                  = "client-secret"
  client_id                                  = "USER-MANAGEMENT"
  consent_required                           = false
  direct_access_grants_enabled               = false
  display_on_consent_screen                  = false
  enabled                                    = true
  extra_config                               = {}
  frontchannel_logout_enabled                = false
  full_scope_allowed                         = false
  implicit_flow_enabled                      = false
  name                                       = "MoH User Management"
  oauth2_device_authorization_grant_enabled  = false
  realm_id                                   = "moh_applications"
  service_accounts_enabled                   = false
  standard_flow_enabled                      = true
  use_refresh_tokens                         = false
  valid_redirect_uris                        = [
    "http://localhost:*",
    "https://localhost:*",
    "https://user-management-dev.hlth.gov.bc.ca/*",
  ]
  web_origins = [
    "*",
  ]
}

resource "keycloak_openid_client_default_scopes" "USER-MANAGEMENT" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id

  default_scopes = [
    "web-origins",
    "profile",
    "roles",
    "email"
  ]
}

resource "keycloak_openid_client_optional_scopes" "USER-MANAGEMENT" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id

  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt"
  ]
}

resource "keycloak_role" "USER-MANAGEMENT_role_user-management-admin" {
  realm_id    = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id   = keycloak_openid_client.USER-MANAGEMENT.id
  name    = "user-management-admin"
  description = "User Management Admin can add/remove groups"
}

resource "keycloak_generic_client_role_mapper" "umc_ums_create-user_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_create-user.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_manage-user-details_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_manage-user-details.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_manage-user-groups_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_manage-user-groups.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_manage-user-roles_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_manage-user-roles.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-bcer-cp_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-bcer-cp.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-eacl_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-eacl.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-emcod_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-emcod.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-fmdb_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-fmdb.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-gis_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-gis.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-hamis_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-hamis.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-hcimweb_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-hcimweb.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-hem_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-hem.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-hscis_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-hscis.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-maid_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-maid.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-maid-case-management-1_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-maid-case-management-1.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-miwt_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-miwt.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-mspdirect-service_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-mspdirect-service.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-pidp-service_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-pidp-service.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-plr_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-plr.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sa-dbaac-portal_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sa-dbaac-portal.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sa-hibc-service-bc-portal_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sa-hibc-service-bc-portal.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sa-sfdc_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sa-sfdc.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sat-case-management-1_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sat-case-management-1.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sat-drug-management-1_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sat-drug-management-1.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-sfds_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-sfds.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-swt_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-swt.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-client-webcaps_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-client-webcaps.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-clients_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-clients.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-events_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-events.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-groups_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-groups.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-metrics_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-metrics.id
}

resource "keycloak_generic_client_role_mapper" "umc_ums_view-users_client_role_mapper" {
  realm_id  = keycloak_openid_client.USER-MANAGEMENT.realm_id
  client_id = keycloak_openid_client.USER-MANAGEMENT.id
  role_id   = keycloak_role.UMS_role_view-users.id
}