module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "HCIMWEB Role"
	claim_name  = "hcimweb_role"
	client_id   = "HCIMWEB"
	base_url    = "https://hcimweb-cl.hlth.gov.bc.ca/HCIMWeb"
	description = "The Healthcare Client Identity Management Web Application provides a web interface to the HCIM system services, allowing point-of-service users to find, add or update health clients, view documented identity and confirm eligibility."
	client_name = "HCIMWEB"
	roles = {	
        "MAINTR_READ_ONLY" = {
            "name" = "MAINTR_READ_ONLY"
            "description" = ""
        },
        "REGR_LTD" = {
            "name" = "REGR_LTD"
            "description" = ""
        },
        "HIBC_REG_NEWBORN" = {
            "name" = "HIBC_REG_NEWBORN"
            "description" = ""
        },
        "REGR_FULL" = {
            "name" = "REGR_FULL"
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
        "REG_ADMIN_HCIM" = {
            "name" = "REG_ADMIN_HCIM"
            "description" = ""
        },
        "REGR_UPDT_ADDR_ONLY" = {
            "name" = "REGR_UPDT_ADDR_ONLY"
            "description" = ""
        },
        "MAINTR_FULL" = {
            "name" = "MAINTR_FULL"
            "description" = ""
        },
        "REGR_UPDT" = {
            "name" = "REGR_UPDT"
            "description" = ""
        },
        "MAINTR_UPDT" = {
            "name" = "MAINTR_UPDT"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	use_refresh_tokens = false
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://hcimweb-cl.hlth.gov.bc.ca/*",
	]
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
