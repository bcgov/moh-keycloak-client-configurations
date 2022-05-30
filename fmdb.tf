module "FMDB" {
  source = "./modules/payara-client"

  client_id   = "FMDB"
  claim_name  = "fmdb_role"
  base_url    = "https://fmdbd.hlth.gov.bc.ca/FMDB"
  description = "Formulary Management Database"
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://fmdbd.hlth.gov.bc.ca/*",
    "https://localhost:8081/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
  ]
  roles = {
    "MOHUSER" = {
      "name"        = "MOHUSER"
      "description" = "The base user permission for FMDB"
    },
    "PSDADMIN" = {
      "name"        = "PSDADMIN"
      "description" = "Admin role for FMDB provides access to code table management"
    }
  }
}
