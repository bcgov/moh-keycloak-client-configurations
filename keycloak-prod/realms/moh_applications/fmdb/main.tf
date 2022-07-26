module "payara-client" {
	source = "../../../../modules/payara-client"
	claim_name  = "fmdb_role"
	client_id   = "FMDB"
	base_url    = "https://fmdb.hlth.gov.bc.ca/FMDB"
	description = ""
	valid_redirect_uris = [
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://sportster.hlth.gov.bc.ca:13381*",
		"https://fmdb.hlth.gov.bc.ca/*",
	]
	roles = {	
        "MOHUSER" = {
            "name" = "MOHUSER"
            "description" = ""
        },
        "PSDADMIN" = {
            "name" = "PSDADMIN"
            "description" = ""
        },
	}
}
