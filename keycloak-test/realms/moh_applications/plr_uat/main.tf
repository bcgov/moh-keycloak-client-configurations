module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "PLR Role"
	claim_name  = "plr_role"
	client_id   = "PLR_UAT"
	base_url    = "https://plrt2.hlth.gov.bc.ca/plr"
	description = "Provider Location Registry"
	client_name = "PLR UAT"
	roles = {	
        "SECONDARY_SOURCE" = {
            "name" = "SECONDARY_SOURCE"
            "description" = ""
        },
        "CONSUMER" = {
            "name" = "CONSUMER"
            "description" = ""
        },
        "REG_ADMIN" = {
            "name" = "REG_ADMIN"
            "description" = ""
        },
        "PRIMARY_SOURCE" = {
            "name" = "PRIMARY_SOURCE"
            "description" = ""
        },
        "DSR_USER" = {
            "name" = "DSR_USER"
            "description" = ""
        },
        "MOH_APPROVER" = {
            "name" = "MOH_APPROVER"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://plrt2.hlth.gov.bc.ca/plr*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
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