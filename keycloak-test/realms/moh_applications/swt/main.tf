module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SWT Role"
	claim_name  = "swt_role"
	client_id   = "SWT"
	base_url    = "https://swtadmint.hlth.gov.bc.ca/swt/admin"
	description = "Surgical Wait Times"
	client_name = "SWT"
	roles = {	
        "Analyst" = {
            "name" = "Analyst"
            "description" = ""
        },
        "Administrator" = {
            "name" = "Administrator"
            "description" = ""
        },
        "Reviewer" = {
            "name" = "Reviewer"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://swtadmint.hlth.gov.bc.ca/*",
	]
}
