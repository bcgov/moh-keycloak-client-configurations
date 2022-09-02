module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "http://eacldev.hlth.gov.bc.ca"
  claim_name                         = "eacl_role"
  client_id                          = "EACL"
  client_name                        = "EACL"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Enhanced Audit Confirmation Letters applications are used to analyze Pharmacare Audit Information to generate letters to end users and process the returned letters."
  mapper_name                        = "EACL Role"
  roles = {
    "EACL_Auditor" = {
      "name"        = "EACL_Auditor"
      },
    "EACL_Sysadmin" = {
      "name"        = "EACL_Sysadmin"
      },
    "PharmaCare_Auditor" = {
      "name"        = "PharmaCare_Auditor"
      },
    "SYSADMIN" = {
      "name"        = "SYSADMIN"
      },
    "Super_Auditor" = {
      "name"        = "Super_Auditor"
      },
    "Super_Sysadmin" = {
      "name"        = "Super_Sysadmin"
      },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://localhost:8081/*",
    "https://eacldev.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
}
