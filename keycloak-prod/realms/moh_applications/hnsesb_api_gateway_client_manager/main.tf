resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "CONFIDENTIAL"
    backchannel_logout_session_required = true
    base_url    = ""
    client_authenticator_type = "client-secret"
    client_id   = "hnsesb_api_gateway_client_manager"
    consent_required = false
    description = "Allows the API Gateway portal to create and manage clients in this realm"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = true
    implicit_flow_enabled       = false
    name = "HNSESB API Gateway Client Manager"
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =true
    standard_flow_enabled = false
    valid_redirect_uris = [
	]
    web_origins = [
	]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
    add_to_id_token = true
    claim_name = "clientHost"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client Host"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientHost"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
    add_to_id_token = true
    claim_name = "clientAddress"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client IP Address"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientAddress"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
    add_to_id_token = true
    claim_name = "clientId"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client ID"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientId"
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
        "realm-management/manage-users" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "manage-users"
        }
        "realm-management/manage-clients" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "manage-clients"
        }
	}
}
