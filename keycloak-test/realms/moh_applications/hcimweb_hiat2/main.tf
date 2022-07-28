module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "HCIMWEB Role"
	claim_name  = "hcimweb_hiat2_role"
	client_id   = "HCIMWEB_HIAT2"
	base_url    = "https://hcimweb-cl-hiat2.hlth.gov.bc.ca/HCIMWeb"
	description = "HCIM Web App"
	valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://hcimweb-cl-hiat2.hlth.gov.bc.ca/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
	]
	roles = {	
        "MAINTR_READ_ONLY" = {
            "name" = "MAINTR_READ_ONLY"
            "description" = ""
        },
        "MAINTR_FULL" = {
            "name" = "MAINTR_FULL"
            "description" = ""
        },
        "REGR_FULL" = {
            "name" = "REGR_FULL"
            "description" = ""
        },
        "REGR_UPDT_ADDR_ONLY" = {
            "name" = "REGR_UPDT_ADDR_ONLY"
            "description" = ""
        },
        "REGR_LTD" = {
            "name" = "REGR_LTD"
            "description" = ""
        },
        "REG_INTEGRITY_CLERK" = {
            "name" = "REG_INTEGRITY_CLERK"
            "description" = ""
        },
        "READ_ONLY_ALL_SRC" = {
            "name" = "READ_ONLY_ALL_SRC"
            "description" = ""
        },
        "HIBC_REG_NEWBORN" = {
            "name" = "HIBC_REG_NEWBORN"
            "description" = ""
        },
        "MAINTR_UPDT" = {
            "name" = "MAINTR_UPDT"
            "description" = ""
        },
        "REGR_UPDT" = {
            "name" = "REGR_UPDT"
            "description" = ""
        },
        "REG_ADMIN_HCIM" = {
            "name" = "REG_ADMIN_HCIM"
            "description" = ""
        },
	}
}
resource "keycloak_openid_user_attribute_protocol_mapper" "org_details" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "org_details"
    client_id = module.payara-client.CLIENT.id
    name = "org_details"
    user_attribute = "org_details"
    realm_id = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
    add_to_id_token = false
    claim_name = "identity_provider"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "IDP"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "identity_provider"
}
