module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SA-HIBC-SERVICE-BC-PORTAL Roles"
	claim_name  = "roles"
	client_id   = "SA-HIBC-SERVICE-BC-PORTAL"
	base_url    = ""
	description = "Special Authority HIBC & Service BC Community Portal"
	client_name = "SA Community Portal"
	roles = {	
        "HIBC_USER" = {
            "name" = "HIBC_USER"
            "description" = ""
        },
        "SERVICE_BC_USER" = {
            "name" = "SERVICE_BC_USER"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = true
	client_role_mapper_add_to_userinfo = true
	valid_redirect_uris = [
		"https://staging-bchealth.cs148.force.com/services/authcallback/Login_with_IDIR_HIBCSBC",
		"https://pwcdev-bchealth.cs142.force.com/services/authcallback/Login_with_IDIR_HIBCSBC",
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
