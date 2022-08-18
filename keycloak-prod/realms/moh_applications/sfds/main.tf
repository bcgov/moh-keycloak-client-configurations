module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "SFDS Role"
	claim_name  = "sfds_role"
	client_id   = "SFDS"
	base_url    = "https://sfds.hlth.gov.bc.ca/sfds"
	description = "The Secure File Delivery Service is a web application for secure file transfer between the Ministry and participating health service providers and between individual health service providers."
	client_name = "SFDS"
	roles = {	
        "ADMIN" = {
            "name" = "ADMIN"
            "description" = ""
        },
        "USER" = {
            "name" = "USER"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"https://sfds.hlth.gov.bc.ca/*",
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
	]
}
resource "keycloak_openid_user_attribute_protocol_mapper" "sfds_auth_1" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "sfds_auth_1"
    client_id = module.payara-client.CLIENT.id
    name = "sfds_auth_1"
    user_attribute = "sfds_auth_1"
    realm_id = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "sfds_auth_3" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "sfds_auth_3"
    client_id = module.payara-client.CLIENT.id
    name = "sfds_auth_3"
    user_attribute = "sfds_auth_3"
    realm_id = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "sfds_auth_2" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "sfds_auth_2"
    client_id = module.payara-client.CLIENT.id
    name = "sfds_auth_2"
    user_attribute = "sfds_auth_2"
    realm_id = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "sfds_auth_4" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "sfds_auth_4"
    client_id = module.payara-client.CLIENT.id
    name = "sfds_auth_4"
    user_attribute = "sfds_auth_4"
    realm_id = module.payara-client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "sfds_auth_5" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "sfds_auth_5"
    client_id = module.payara-client.CLIENT.id
    name = "sfds_auth_5"
    user_attribute = "sfds_auth_5"
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
