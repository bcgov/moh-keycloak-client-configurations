module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "HEM Role"
	claim_name  = "hem_role"
	client_id   = "HEM"
	base_url    = "https://hemdev.hlth.gov.bc.ca/HEM-web"
	description = "Health Environment Manager"
	client_name = "The Health Environment Manager application is used to schedule the change requests and server patching."
	roles = {	
        "hem" = {
            "name" = "hem"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"http://localhost:8080/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://hemdev.hlth.gov.bc.ca/*",
		"https://localhost:8081/*",
	]
}
