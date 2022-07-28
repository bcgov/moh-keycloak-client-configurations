module "payara-client" {

	source = "../../../../modules/payara-client"
	mapper_name = "Role mapper"
	claim_name  = "fmdb_role"
	client_id   = "FMDB"
	base_url    = "https://fmdbt.hlth.gov.bc.ca/FMDB"
	description = "Formulary Management Database v3"
	client_name = "FMDB"
	roles = {	
        "PSDADMIN" = {
            "name" = "PSDADMIN"
            "description" = "Admin role for FMDB provides access to code table management"
        },
        "MOHUSER" = {
            "name" = "MOHUSER"
            "description" = "The base user permission for FMDB"
        },
	}
	service_accounts_enabled = false
	use_refresh_token = false
	valid_redirect_uris = [
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://fmdbt.hlth.gov.bc.ca/*",
	]
}
