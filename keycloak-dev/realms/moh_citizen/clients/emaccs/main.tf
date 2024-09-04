module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "EMACCS_role_not_used"
  client_id                          = "EMACCS"
  client_name                        = "EMACCS"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "Emergency Medical Assistant Continuing Competency System"
  mapper_name                        = "EMACCS Role - Not Used"
  roles = {
  }
  service_accounts_enabled = true
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://emaccsd.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
