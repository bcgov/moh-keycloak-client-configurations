module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "MAID"
  client_name                        = "MAiD Case Management"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Medical Assistance in Dying"
  mapper_name                        = "client roles"
  roles = {
    "MAiD-Analyst" = {
      "name"        = "MAiD-Analyst"
      "description" = ""
    },
    "MAiD-Manager-1" = {
      "name"        = "MAiD-Manager-1"
      "description" = ""
    },
    "MAiD-Manager-2" = {
      "name"        = "MAiD-Manager-2"
      "description" = ""
    },
    "MAiD-Manager-3" = {
      "name"        = "MAiD-Manager-3"
      "description" = ""
    },
    "MAiD-Manager-4" = {
      "name"        = "MAiD-Manager-4"
      "description" = ""
    },
    "MAiD-System-Administrator" = {
      "name"        = "MAiD-System-Administrator"
      "description" = ""
    },
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "*",
  ]
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
