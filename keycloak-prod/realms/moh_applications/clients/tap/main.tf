module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://tap.hlth.gov.bc.ca/tap"
  claim_name                         = "tap_role"
  client_id                          = "TAP"
  client_name                        = "TAP"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Travel Assistance Program Analysis Reports is a report web application that allows authorized persons to see how incidence of use of different modes of transportation by the general public."
  mapper_name                        = "TAP Role"
  roles = {
    "TAPUSER" = {
      "name" = "TAPUSER"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://tap.hlth.gov.bc.ca/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
