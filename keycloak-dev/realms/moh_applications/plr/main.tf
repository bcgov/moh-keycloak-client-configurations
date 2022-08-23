module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "https://plrd.hlth.gov.bc.ca/plr"
  claim_name                         = "plr_role"
  client_id                          = "PLR"
  client_name                        = "PLR"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Provider and Location Registry (PLR) is a standards-based repository of core provider data supplied by authorized sources, and available to authorized consumers, that facilitates the formal exchange of health information."
  mapper_name                        = "PLR Role"
  roles = {
    "DSR_USER" = {
      "name"        = "DSR_USER"
      "description" = ""
    },
    "CONSUMER" = {
      "name"        = "CONSUMER"
      "description" = ""
    },
    "MOH_APPROVER" = {
      "name"        = "MOH_APPROVER"
      "description" = ""
    },
    "PRIMARY_SOURCE" = {
      "name"        = "PRIMARY_SOURCE"
      "description" = ""
    },
    "REG_ADMIN" = {
      "name"        = "REG_ADMIN"
      "description" = ""
    },
    "SECONDARY_SOURCE" = {
      "name"        = "SECONDARY_SOURCE"
      "description" = ""
    },
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "http://localhost:28080/*",
    "https://localhost:8081/*",
    "https://plrd.hlth.gov.bc.ca/plr*",
    "https://plrmerge.hlth.gov.bc.ca/plr/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://qa-sts.healthbc.org/adfs/ls/*",
  ]
}
resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = module.payara-client.CLIENT.realm_id
  client_id = module.payara-client.CLIENT.id

  default_scopes = [
    "profile",
    "email",
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
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
  add_to_id_token  = true
  claim_name       = "clientHost"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "Client Host"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "clientHost"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
  add_to_id_token  = true
  claim_name       = "clientId"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "Client ID"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "clientId"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
  add_to_id_token  = true
  claim_name       = "clientAddress"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "Client IP Address"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "clientAddress"
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
    "USER-MANAGEMENT-SERVICE/view-client-plr" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"    = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-users"      = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
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
    "USER-MANAGEMENT-SERVICE/view-client-plr" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-plr"
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

