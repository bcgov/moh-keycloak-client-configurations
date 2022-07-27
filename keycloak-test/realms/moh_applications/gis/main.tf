module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "GIS Role"
	claim_name  = "gis_role"
	client_id   = "GIS"
	base_url    = "https://gist.hlth.gov.bc.ca/gis"
	description = "Guaranteed Income Support"
	valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://shadow.hlth.gov.bc.ca:15281/*",
		"https://gist.hlth.gov.bc.ca/*",
	]
	roles = {	
        "GISUSER" = {
            "name" = "GISUSER"
            "description" = ""
        },
	}
}
