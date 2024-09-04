module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "EMACCS_role"
  client_id                          = "EMACCS"
  client_name                        = "EMACCS"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "TODO"
  mapper_name                        = "EMACCS Role"
  roles = {
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://emaccsd.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
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