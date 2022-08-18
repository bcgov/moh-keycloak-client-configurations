module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SA-DBAAC-PORTAL Roles"
	claim_name  = "roles"
	client_id   = "SA-DBAAC-PORTAL"
	base_url    = ""
	description = "Special Authority Drug Benefit Adjudication Advisory Committee Community Portal"
	client_name = "SA DBAAC Portal"
	roles = {	
        "USER" = {
            "name" = "USER"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = true
	client_role_mapper_add_to_userinfo = true
	valid_redirect_uris = [
		"https://staging-bchealth.cs148.force.com/DBAACEC/services/authcallback/Login_with_IDIR_DBAACEC",
		"https://pwcdev-bchealth.cs142.force.com/DBAACEC/services/authcallback/Login_with_IDIR_DBAACEC",
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
