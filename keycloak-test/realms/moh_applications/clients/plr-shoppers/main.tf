resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "18000"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PLR-SHOPPERS"
  consent_required                    = false
  description                         = "The Provider and Location Registry (PLR) is a standards-based repository of core provider data supplied by authorized sources, and available to authorized consumers, that facilitates the formal exchange of health information."
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
  claim_value         = "00024728"
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
    "PLR_IAT/CONSUMER" = {
      "client_id" = var.PLR_IAT.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_UAT/CONSUMER" = {
      "client_id" = var.PLR_UAT.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_CONF/CONSUMER" = {
      "client_id" = var.PLR_CONF.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_SIT/CONSUMER" = {
      "client_id" = var.PLR_SIT.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_REV/CONSUMER" = {
      "client_id" = var.PLR_REV.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_STG/CONSUMER" = {
      "client_id" = var.PLR_STG.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
    "PLR_FLVR/CONSUMER" = {
      "client_id" = var.PLR_FLVR.CLIENT.id,
      "role_id"   = "CONSUMER"
    }
  }
}
module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "PLR_IAT/CONSUMER"  = var.PLR_IAT.ROLES["CONSUMER"].id
    "PLR_UAT/CONSUMER"  = var.PLR_UAT.ROLES["CONSUMER"].id
    "PLR_CONF/CONSUMER" = var.PLR_CONF.ROLES["CONSUMER"].id
    "PLR_SIT/CONSUMER"  = var.PLR_SIT.ROLES["CONSUMER"].id
    "PLR_REV/CONSUMER"  = var.PLR_REV.ROLES["CONSUMER"].id
    "PLR_STG/CONSUMER"  = var.PLR_STG.ROLES["CONSUMER"].id
    "PLR_FLVR/CONSUMER" = var.PLR_FLVR.ROLES["CONSUMER"].id
  }
}