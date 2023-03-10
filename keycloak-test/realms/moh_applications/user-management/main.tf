resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "PUBLIC"
  backchannel_logout_session_required = true
  base_url                            = "https://user-management-test.hlth.gov.bc.ca/"
  client_authenticator_type           = "client-secret"
  client_id                           = "USER-MANAGEMENT"
  consent_required                    = false
  description                         = "The Keycloak User Management Console is a web application that is used by application access teams (such as the ITSB access team) to manage user permissions to applications secured by Keycloak."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "MoH User Management"
  pkce_code_challenge_method          = "S256"
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://user-management-test.hlth.gov.bc.ca/*",
  ]
  web_origins = [
    "+",
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "user-management-admin" = {
      "name"        = "user-management-admin"
      "description" = "User Management Admin can add/remove groups"
    },
  }
}
resource "keycloak_openid_group_membership_protocol_mapper" "Group-Membership" {
  name            = "user groups"
  claim_name      = "groups"
  client_id       = keycloak_openid_client.CLIENT.id
  realm_id        = keycloak_openid_client.CLIENT.realm_id
  add_to_userinfo = false
  add_to_id_token = false
  full_path       = false
}
module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "USER-MANAGEMENT-SERVICE/create-user"                           = var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-details"                   = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    "USER-MANAGEMENT-SERVICE/manage-all-groups"                     = var.USER-MANAGEMENT-SERVICE.ROLES["manage-all-groups"].id,
    "USER-MANAGEMENT-SERVICE/manage-org"                            = var.USER-MANAGEMENT-SERVICE.ROLES["manage-org"].id,
    "USER-MANAGEMENT-SERVICE/manage-own-groups"                     = var.USER-MANAGEMENT-SERVICE.ROLES["manage-own-groups"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-roles"                     = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    "USER-MANAGEMENT-SERVICE/view-client-bcer-cp"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-bcer-cp"].id,
    "USER-MANAGEMENT-SERVICE/view-client-eacl"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl"].id,
    "USER-MANAGEMENT-SERVICE/view-client-eacl_stg"                  = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl_stg"].id,
    "USER-MANAGEMENT-SERVICE/view-client-emcod"                     = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-emcod"].id,
    "USER-MANAGEMENT-SERVICE/view-client-fmdb"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-fmdb"].id,
    "USER-MANAGEMENT-SERVICE/view-client-gis"                       = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-gis"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hamis"                     = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hiat1"             = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat1"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hiat2"             = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat2"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hiat3"             = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat3"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hs1"               = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hs1"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hsit"              = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hsit"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_huat"              = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_huat"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hem"                       = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hem"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hscis"                     = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hscis"].id,
    "USER-MANAGEMENT-SERVICE/view-client-maid"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-maid"].id,
    "USER-MANAGEMENT-SERVICE/view-client-miwt"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt"].id,
    "USER-MANAGEMENT-SERVICE/view-client-miwt_stg"                  = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt_stg"].id,
    "USER-MANAGEMENT-SERVICE/view-client-mspdirect-service"         = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-mspdirect-service-uat"     = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service-uat"].id,
    "USER-MANAGEMENT-SERVICE/view-client-pidp-service"              = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_conf"                  = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_conf"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_flvr"                  = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_flvr"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_iat"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_iat"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_rev"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_rev"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_sit"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_sit"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_stg"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_stg"].id,
    "USER-MANAGEMENT-SERVICE/view-client-plr_uat"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_uat"].id,
    "USER-MANAGEMENT-SERVICE/view-client-primary-care"              = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-primary-care"].id,
    "USER-MANAGEMENT-SERVICE/view-client-prime-application-local"   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prime-application-local"].id,
    "USER-MANAGEMENT-SERVICE/view-client-prp-service"               = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prp-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sa-dbaac-portal"           = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-dbaac-portal"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sa-hibc-service-bc-portal" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-hibc-service-bc-portal"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sa-sfdc"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-sfdc"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sat-eforms"                = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sat-eforms"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sfds"                      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sfds"].id,
    "USER-MANAGEMENT-SERVICE/view-client-swt"                       = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt"].id,
    "USER-MANAGEMENT-SERVICE/view-client-swt_stg"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt_stg"].id,
    "USER-MANAGEMENT-SERVICE/view-client-webcaps"                   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-webcaps"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"                          = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-events"                           = var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    "USER-MANAGEMENT-SERVICE/view-groups"                           = var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    "USER-MANAGEMENT-SERVICE/view-metrics"                          = var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
    "USER-MANAGEMENT-SERVICE/view-users"                            = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
  }
}
