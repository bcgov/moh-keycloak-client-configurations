module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SA-SFDC Roles"
	claim_name  = "roles"
	client_id   = "SA-SFDC"
	base_url    = ""
	description = "Sales Force Pharmacare Special Authority"
	client_name = "Special Authority"
	roles = {	
        "SA_DRUG_MANAGER" = {
            "name" = "SA_DRUG_MANAGER"
            "description" = ""
        },
        "SA_REPORTS_DASHBOARD" = {
            "name" = "SA_REPORTS_DASHBOARD"
            "description" = ""
        },
        "MOH_USER" = {
            "name" = "MOH_USER"
            "description" = ""
        },
        "SA_ADMINISTRATOR" = {
            "name" = "SA_ADMINISTRATOR"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = true
	client_role_mapper_add_to_userinfo = true
	valid_redirect_uris = [
		"https://bchealth--pwcdev.my.salesforce.com/services/authcallback/Login_with_IDIR",
		"https://bchealth--staging.my.salesforce.com/services/authcallback/Login_with_IDIR",
	]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
    add_to_id_token = true
    claim_name = "identity_provider"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "IDP"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "identity_provider"
}
