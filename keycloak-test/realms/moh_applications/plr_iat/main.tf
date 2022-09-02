module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "https://plriat.hlth.gov.bc.ca/plr"
  claim_name                         = "plr_role"
  client_id                          = "PLR_IAT"
  client_name                        = "PLR IAT"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Provider and Location Registry (PLR) is a standards-based repository of core provider data supplied by authorized sources, and available to authorized consumers, that facilitates the formal exchange of health information."
  mapper_name                        = "PLR Role"
  roles = {
    "DSR_USER" = {
      "name" = "DSR_USER"
    },
    "CONSUMER" = {
      "name" = "CONSUMER"
    },
    "MOH_APPROVER" = {
      "name" = "MOH_APPROVER"
    },
    "PRIMARY_SOURCE" = {
      "name" = "PRIMARY_SOURCE"
    },
    "REG_ADMIN" = {
      "name" = "REG_ADMIN"
    },
    "SECONDARY_SOURCE" = {
      "name" = "SECONDARY_SOURCE"
    },
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "https://plriat.hlth.gov.bc.ca/plr*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
  ]
}
resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = module.payara-client.CLIENT.realm_id
  client_id = module.payara-client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins"
  ]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "org_details" {
  add_to_id_token = false
  add_to_userinfo = false
  claim_name      = "org_details"
  client_id       = module.payara-client.CLIENT.id
  name            = "org_details"
  user_attribute  = "org_details"
  realm_id        = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "IDP"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "identity_provider"
}
module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = module.payara-client.CLIENT.realm_id
  client_id = module.payara-client.CLIENT.id
  roles = {
    "USER-MANAGEMENT-SERVICE/view-client-plr_iat" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_iat"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"        = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-users"          = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../modules/service-account-roles"
  realm_id                = module.payara-client.CLIENT.realm_id
  client_id               = module.payara-client.CLIENT.id
  service_account_user_id = module.payara-client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "USER-MANAGEMENT-SERVICE/view-client-plr_iat" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-plr_iat"
    }
    "USER-MANAGEMENT-SERVICE/view-clients" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "USER-MANAGEMENT-SERVICE/view-users" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-users"
    }
    "realm-management/view-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-users"
    }
  }
}
