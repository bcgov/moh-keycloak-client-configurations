resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "18000"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PLR-PRIMARY-CARE"
  consent_required                    = false
  description                         = "PRIMARY-CARE service account for access to PLR"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}
resource "keycloak_openid_hardcoded_claim_protocol_mapper" "orgId" {
  add_to_access_token = true
  add_to_id_token     = true
  add_to_userinfo     = true
  claim_name          = "orgId"
  claim_value         = "90001234"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "orgId"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

module "service-account-roles" {
  source                  = "../../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "PLR_IAT/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_IAT.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_UAT/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_UAT.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_CONF/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_CONF.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_SIT/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_SIT.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_REV/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_REV.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_STG/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_STG.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
    "PLR_FLVR/SECONDARY_SOURCE" = {
      "client_id" = var.PLR_FLVR.CLIENT.id,
      "role_id"   = "SECONDARY_SOURCE"
    }
  }
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PLR_IAT/SECONDARY_SOURCE"  = var.PLR_IAT.ROLES["SECONDARY_SOURCE"].id
    "PLR_UAT/SECONDARY_SOURCE"  = var.PLR_UAT.ROLES["SECONDARY_SOURCE"].id
    "PLR_CONF/SECONDARY_SOURCE" = var.PLR_CONF.ROLES["SECONDARY_SOURCE"].id
    "PLR_SIT/SECONDARY_SOURCE"  = var.PLR_SIT.ROLES["SECONDARY_SOURCE"].id
    "PLR_REV/SECONDARY_SOURCE"  = var.PLR_REV.ROLES["SECONDARY_SOURCE"].id
    "PLR_STG/SECONDARY_SOURCE"  = var.PLR_STG.ROLES["SECONDARY_SOURCE"].id
    "PLR_FLVR/SECONDARY_SOURCE" = var.PLR_FLVR.ROLES["SECONDARY_SOURCE"].id
  }
}