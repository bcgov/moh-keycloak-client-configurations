module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "SA-HIBC-SERVICE-BC-PORTAL"
  client_name                        = "SA Community Portal"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Special Authority HIBC & Service BC Community Portal"
  mapper_name                        = "SA-HIBC-SERVICE-BC-PORTAL Roles"
  roles = {
    "SERVICE_BC_USER" = {
      "name" = "SERVICE_BC_USER"
    },
    "HIBC_USER" = {
      "name" = "HIBC_USER"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://bchealth.force.com/services/authcallback/Login_with_IDIR_HIBCSBC",
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
