module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "HAMIS Role"
	claim_name  = "hamis_role"
	client_id   = "HAMIS"
	base_url    = "https://hamisdev.hlth.gov.bc.ca/hamis"
	description = "Health Authority Management Information System"
	client_name = "HAMIS"
	roles = {	
        "HMS_DATA_SUBMITTER" = {
            "name" = "HMS_DATA_SUBMITTER"
            "description" = ""
        },
        "HMS_STANDARD_USER" = {
            "name" = "HMS_STANDARD_USER"
            "description" = ""
        },
        "HMS_ADMIN" = {
            "name" = "HMS_ADMIN"
            "description" = ""
        },
	}
	service_accounts_enabled = true
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"http://localhost:8080/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://qa-sts.healthbc.org/adfs/ls/*",
		"https://hamisdev.hlth.gov.bc.ca/*",
		"https://localhost:8081/*",
	]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
    add_to_id_token = true
    claim_name = "clientId"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "Client ID"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "clientId"
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
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
    add_to_id_token = true
    claim_name = "clientAddress"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "Client IP Address"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "clientAddress"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
    add_to_id_token = true
    claim_name = "clientHost"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "Client Host"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "clientHost"
}
module "scope-mappings" {
    source = "../../../../modules/scope-mappings"
    realm_id = module.payara-client.CLIENT.realm_id
    client_id = module.payara-client.CLIENT.id
    roles = {
		"USER-MANAGEMENT-SERVICE/view-users" = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
		"USER-MANAGEMENT-SERVICE/view-clients" = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
		"USER-MANAGEMENT-SERVICE/view-client-hamis" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
	}
}
module "service-account-roles" {
	source = "../../../../modules/service-account-roles"
	realm_id = module.payara-client.CLIENT.realm_id
	client_id = module.payara-client.CLIENT.id
	service_account_user_id = module.payara-client.CLIENT.service_account_user_id
	realm_roles = {
		"default-roles-moh_applications" = "default-roles-moh_applications",
	}
	client_roles = {
        "USER-MANAGEMENT-SERVICE/view-users" = {
            "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
            "role_id" = "view-users"
        }
        "USER-MANAGEMENT-SERVICE/view-clients" = {
            "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
            "role_id" = "view-clients"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hamis" = {
            "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
            "role_id" = "view-client-hamis"
        }
	}
}
