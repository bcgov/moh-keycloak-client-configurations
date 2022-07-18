module "payara-client" {
	source = "../../../../modules/payara-client"
	claim_name  = "fmdb_role"
	client_id   = "FMDB"
	base_url    = "https://fmdbd.hlth.gov.bc.ca/FMDB"
	description = "Formulary Management Database"
	valid_redirect_uris = [
		"http://localhost:8080/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://fmdbd.hlth.gov.bc.ca/*",
		"https://localhost:8081/*",
	]
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
}
