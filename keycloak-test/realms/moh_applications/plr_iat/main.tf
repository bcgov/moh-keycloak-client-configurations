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
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://plriat.hlth.gov.bc.ca/plr*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
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
