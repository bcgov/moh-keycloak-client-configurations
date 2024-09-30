module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "SA-HIBC-SERVICE-BC-PORTAL"
  client_name                        = "SA Community Portal"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Special Authority HIBC & Service BC Community Portal"
  mapper_name                        = "SA-HIBC-SERVICE-BC-PORTAL Roles"
  roles = {
    "HIBC_USER" = {
      "name" = "HIBC_USER"
    },
    "SERVICE_BC_USER" = {
      "name" = "SERVICE_BC_USER"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://pwcdev-bchealth.cs142.force.com/services/authcallback/Login_with_IDIR_HIBCSBC",
    "https://staging-bchealth.cs148.force.com/services/authcallback/Login_with_IDIR_HIBCSBC",
    "https://staging-bchealth.cs148.sandbox.my.site.com/services/authcallback/Login_with_IDIR_HIBCSBC",
    "https://bchealth--satdevorg.sandbox.my.salesforce.com/*",
    "https://bchealth--satdevorg.sandbox.my.site.com/*",
    "https://bchealth--staging.sandbox.my.salesforce.com/*",
    "https://bchealth--satdev1.sandbox.my.salesforce.com/*",
    "https://bchealth--satdev1.sandbox.my.site.com/*",
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
