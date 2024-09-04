module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "emacs_role"
  client_id                          = "EMACS"
  client_name                        = "EMACS"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "TODO"
  mapper_name                        = "EMACS Role"
  roles = {
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://qa-sts.healthbc.org/adfs/ls/*",
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