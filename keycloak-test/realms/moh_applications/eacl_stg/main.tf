module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "https://eaclstg.hlth.gov.bc.ca"
  claim_name                         = "eacl_role"
  client_id                          = "EACL_STG"
  client_name                        = "EACL STG"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Enhanced Audit Confirmation Letters applications are used to analyze Pharmacare Audit Information to generate letters to end users and process the returned letters."
  mapper_name                        = "EACL Role"
  roles = {
    "EACL_Auditor" = {
      "name"        = "EACL_Auditor"
      "description" = ""
    },
    "EACL_Sysadmin" = {
      "name"        = "EACL_Sysadmin"
      "description" = ""
    },
    "PharmaCare_Auditor" = {
      "name"        = "PharmaCare_Auditor"
      "description" = ""
    },
    "SYSADMIN" = {
      "name"        = "SYSADMIN"
      "description" = ""
    },
    "Super_Auditor" = {
      "name"        = "Super_Auditor"
      "description" = ""
    },
    "Super_Sysadmin" = {
      "name"        = "Super_Sysadmin"
      "description" = ""
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://eaclstg.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
