module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://hem.hlth.gov.bc.ca/HEM-web"
  claim_name                         = "hem_role"
  client_id                          = "HEM"
  client_name                        = "HEM"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Health Environment Manager application is used to schedule the change requests and server patching."
  mapper_name                        = "HEM Role"
  roles = {
    "hem" = {
      "name" = "hem"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://hem.hlth.gov.bc.ca/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
