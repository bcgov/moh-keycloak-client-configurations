resource "keycloak_openid_client" "CLIENT" {
	access_type = "CONFIDENTIAL"
	access_token_lifespan = "300"
	backchannel_logout_session_required = false
	base_url    = ""
	client_authenticator_type = "client-secret"
	client_id   = "PIDP-SERVICE"
	consent_required = false
	description = ""
	direct_access_grants_enabled = false
	enabled = true
	frontchannel_logout_enabled = false
	full_scope_allowed          = false
	implicit_flow_enabled       = false
	name = ""
	realm_id = "moh_applications"
	service_accounts_enabled =true
	standard_flow_enabled = false
	use_refresh_tokens = false
	valid_redirect_uris = [
	]
	web_origins = [	]
	admin_url   = ""
}

resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client ID"
	claim_name = "clientId"
	claim_value_type = "String"
	session_note = "clientId"
	add_to_id_token = true
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client IP Address"
	claim_name = "clientAddress"
	claim_value_type = "String"
	session_note = "clientAddress"
	add_to_id_token = true
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client Host"
	claim_name = "clientHost"
	claim_value_type = "String"
	session_note = "clientHost"
	add_to_id_token = true
}

module "client-roles" {
	source = "../../../../modules/client-roles"
	client_id = keycloak_openid_client.CLIENT.id
	realm_id = keycloak_openid_client.CLIENT.realm_id
	roles = {
		"feature_pidp_demo" = {
			"name"        = "feature_pidp_demo"
			"description" = ""
		},
		"USER" = {
			"name"        = "USER"
			"description" = ""
		},
		"feature_amh_demo" = {
			"name"        = "feature_amh_demo"
			"description" = ""
		},
		"ADMIN" = {
			"name"        = "ADMIN"
			"description" = ""
		},
	}
}
module "scope-mappings" {
	source = "../../../../modules/scope-mappings"
	realm_id = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	roles = {
		"USER-MANAGEMENT-SERVICE/create-user" = "2ea1ec2c-1603-46a2-a348-6d0c7ce559da",
		"USER-MANAGEMENT-SERVICE/view-users" = "beddbeb0-650e-4bd9-8484-d05f789c61b6",
		"USER-MANAGEMENT-SERVICE/manage-user-roles" = "f539f4bf-ba7a-4ba3-a8d4-a47f786e205d",
		"USER-MANAGEMENT-SERVICE/view-client-pidp-service" = "8f6a5f08-bd8c-41b4-83a3-6c08553ac98f",
		"USER-MANAGEMENT-SERVICE/view-client-hcimweb" = "5f854e07-fe45-497c-85e3-a3551b88ac66",
		"USER-MANAGEMENT-SERVICE/view-client-uci-sso" = "17213d47-65a1-41e0-96bd-5b90878e33cf",
		"USER-MANAGEMENT-SERVICE/view-clients" = "8742c7c0-664c-4321-8225-f70420d299f7",
		"USER-MANAGEMENT-SERVICE/manage-user-details" = "1ba3bbcb-d2db-4cb3-be33-2f88062e0dac",
		"USER-MANAGEMENT-SERVICE/view-client-sat-eforms" = "751a33ed-9414-4537-9196-4c6055b9b514",
		"USER-MANAGEMENT-SERVICE/view-client-hcimweb_huat" = "925e39fa-1941-4e25-9823-aded372533de",
	}
}

module "service-account-roles" {
	source = "../../../../modules/service-account-roles"
	realm_id = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
	realm_roles = {
		"default-roles-moh_applications" = "default-roles-moh_applications",
	}
	client_roles = {
		"USER-MANAGEMENT-SERVICE/create-user"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "create-user"
		},
		"USER-MANAGEMENT-SERVICE/manage-user-roles"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "manage-user-roles"
		},
		"USER-MANAGEMENT-SERVICE/view-users"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-users"
		},
		"USER-MANAGEMENT-SERVICE/view-client-pidp-service"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-client-pidp-service"
		},
		"USER-MANAGEMENT-SERVICE/view-client-hcimweb"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-client-hcimweb"
		},
		"USER-MANAGEMENT-SERVICE/view-client-uci-sso"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-client-uci-sso"
		},
		"USER-MANAGEMENT-SERVICE/view-clients"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-clients"
		},
		"USER-MANAGEMENT-SERVICE/manage-user-details"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "manage-user-details"
		},
		"USER-MANAGEMENT-SERVICE/view-client-sat-eforms"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-client-sat-eforms"
		},
		"USER-MANAGEMENT-SERVICE/view-client-hcimweb_huat"= {
			"client_id" = "2ddc7173-34f3-41ff-9beb-66c7802717ce",
			"role_id" = "view-client-hcimweb_huat"
		},
	}
}
