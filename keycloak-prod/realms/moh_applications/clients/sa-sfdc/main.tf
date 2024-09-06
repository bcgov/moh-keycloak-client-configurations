module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "SA-SFDC"
  client_name                        = "Special Authority"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Sales Force Pharmacare Special Authority"
  mapper_name                        = "SA-SFDC Roles"
  roles = {
    "MOH_USER" = {
      "name" = "MOH_USER"
    },
    "SA_ADMINISTRATOR" = {
      "name" = "SA_ADMINISTRATOR"
    },
    "SA_DRUG_MANAGER" = {
      "name" = "SA_DRUG_MANAGER"
    },
    "SA_REPORTS_DASHBOARD" = {
      "name" = "SA_REPORTS_DASHBOARD"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://bchealth.my.salesforce.com/services/authcallback/Login_with_IDIR",
    "https://bchealth--edrddata01.sandbox.my.salesforce.com/*"
  ]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "IDP"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "identity_provider"
}
