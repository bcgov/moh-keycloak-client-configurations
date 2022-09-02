module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "https://swtadminstg.hlth.gov.bc.ca/swt/admin"
  claim_name                         = "swt_role"
  client_id                          = "SWT_STG"
  client_name                        = "SWT STG"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Surgical Wait Times application allows the general public to view the wait list for each type of elective surgery in the province."
  mapper_name                        = "SWT Role"
  roles = {
    "Administrator" = {
      "name" = "Administrator"
    },
    "Analyst" = {
      "name" = "Analyst"
    },
    "Reviewer" = {
      "name" = "Reviewer"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://swtadminstg.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
