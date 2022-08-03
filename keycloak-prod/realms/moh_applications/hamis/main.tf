module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "HAMIS Role"
	claim_name  = "hamis_role"
	client_id   = "HAMIS"
	base_url    = "https://hamis.hlth.gov.bc.ca/hamis"
	description = "Health Authority Management Information System"
	client_name = "HAMIS"
	roles = {	
        "HMS_ADMIN" = {
            "name" = "HMS_ADMIN"
            "description" = ""
        },
        "HMS_STANDARD_USER" = {
            "name" = "HMS_STANDARD_USER"
            "description" = ""
        },
        "HMS_DATA_SUBMITTER" = {
            "name" = "HMS_DATA_SUBMITTER"
            "description" = ""
        },
	}
	service_accounts_enabled = true
	client_role_mapper_add_to_id_token = false
	client_role_mapper_add_to_userinfo = false
	valid_redirect_uris = [
		"https://hamis.hlth.gov.bc.ca/*",
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
	]
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
module "scope-mappings" {
    source = "../../../../modules/scope-mappings"
    realm_id = module.payara-client.CLIENT.realm_id
    client_id = module.payara-client.CLIENT.id
    roles = {
		"USER-MANAGEMENT-SERVICE/view-users" = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
		"USER-MANAGEMENT-SERVICE/view-client-hamis" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
		"USER-MANAGEMENT-SERVICE/view-clients" = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
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
        "USER-MANAGEMENT-SERVICE/view-client-hamis" = {
            "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
            "role_id" = "view-client-hamis"
        }
        "USER-MANAGEMENT-SERVICE/view-clients" = {
            "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
            "role_id" = "view-clients"
        }
	}
}
