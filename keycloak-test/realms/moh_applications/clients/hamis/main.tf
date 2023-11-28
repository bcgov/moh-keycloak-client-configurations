module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://hamistst.hlth.gov.bc.ca/hamis"
  claim_name                         = "hamis_role"
  client_id                          = "HAMIS"
  client_name                        = "HAMIS"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Health Authority Management Information System is used to report Health Authority financial and statistical general ledger information."
  mapper_name                        = "HAMIS Role"
  roles = {
    "HMS_ADMIN" = {
      "name" = "HMS_ADMIN"
    },
    "HMS_DATA_SUBMITTER" = {
      "name" = "HMS_DATA_SUBMITTER"
    },
    "HMS_STANDARD_USER" = {
      "name" = "HMS_STANDARD_USER"
    },
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://localhost:8081/*",
    "https://hamisdev.hlth.gov.bc.ca/*",
    "https://hamistst.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
  ]
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
  source    = "../../../../../modules/scope-mappings"
  realm_id  = module.payara-client.CLIENT.realm_id
  client_id = module.payara-client.CLIENT.id
  roles = {
    "USER-MANAGEMENT-SERVICE/view-client-hamis" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"      = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-users"        = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../../modules/service-account-roles"
  realm_id                = module.payara-client.CLIENT.realm_id
  client_id               = module.payara-client.CLIENT.id
  service_account_user_id = module.payara-client.CLIENT.service_account_user_id
  realm_roles = {
    "offline_access"    = "offline_access",
    "uma_authorization" = "uma_authorization",
  }
  client_roles = {
    "USER-MANAGEMENT-SERVICE/view-client-hamis" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-hamis"
    }
    "USER-MANAGEMENT-SERVICE/view-clients" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "USER-MANAGEMENT-SERVICE/view-users" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-users"
    }
  }
}
