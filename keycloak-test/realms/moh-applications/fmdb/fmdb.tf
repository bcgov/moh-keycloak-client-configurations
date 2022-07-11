module "payara_client" {
  source = "../../../../modules/payara-client"

  client_id   = "FMDB"
  claim_name  = "fmdb_role"
  base_url    = "https://fmdbt.hlth.gov.bc.ca/FMDB"
  description = "Formulary Management Database v3"
  valid_redirect_uris = [
    "https://fmdbt.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*"
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
