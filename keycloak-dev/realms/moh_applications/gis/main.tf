module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "GIS Role"
	claim_name  = "gis_role"
	client_id   = "GIS"
	base_url    = "https://gisd.hlth.gov.bc.ca/gis"
	description = "Guaranteed Income Support"
	client_name = "GIS"
	roles = {	
        "GISUSER" = {
            "name" = "GISUSER"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	valid_redirect_uris = [
		"http://localhost:8081/*",
		"http://localhost:8080/*",
		"https://gisd.hlth.gov.bc.ca/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://qa-sts.healthbc.org/adfs/ls/*",
		"https://localhost:8081/*",
	]
}
