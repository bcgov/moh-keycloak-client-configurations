module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SWT Role"
	claim_name  = "swt_role"
	client_id   = "SWT_STG"
	base_url    = "https://swtadminstg.hlth.gov.bc.ca/swt/admin"
	description = "The Surgical Wait Times application allows the general public to view the wait list for each type of elective surgery in the province."
	client_name = "SWT STG"
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
		"https://swtadminstg.hlth.gov.bc.ca/*",
	]
}
