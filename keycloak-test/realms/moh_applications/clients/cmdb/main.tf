module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://cmdbt.hlth.gov.bc.ca"
  client_id                          = "CMDB"
  client_name                        = "CMDB"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Configuration Management Database (CMDB) is used to store information on MoH software assets"
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://cmdbt.hlth.gov.bc.ca/*",
    "http://localhost:8444/*"
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

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "IDP"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "identity_provider"
}
