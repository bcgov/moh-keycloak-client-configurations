resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = "300"
    access_type = "PUBLIC"
    admin_url   = ""
    backchannel_logout_session_required = false
    base_url    = ""
    client_authenticator_type = "client-secret"
    client_id   = "PIDP-WEBAPP"
    consent_required = false
    description = ""
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    use_refresh_tokens = false
    valid_redirect_uris = [
		"http://localhost:*",
		"https://dev.healthprovideridentityportal.gov.bc.ca/*",
		"https://dev.healthprovideridentityportal.gov.bc.ca",
	]
    web_origins = [
		"*",
	]
}
resource "keycloak_openid_audience_protocol_mapper" "PIDP-SERVICE-aud-mapper" {
    add_to_id_token = false
    client_id = keycloak_openid_client.CLIENT.id
    included_client_audience = "PIDP-SERVICE"
    name = "PIDP-SERVICE aud mapper"
    realm_id = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "given_names" {
    add_to_id_token = true
    claim_name = "given_names"
    client_id = keycloak_openid_client.CLIENT.id
    name = "given_names"
    user_attribute = "given_names"
    realm_id = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_session_note_protocol_mapper" "identity_provider" {
    add_to_id_token = false
    claim_name = "identity_provider"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "identity_provider"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "identity_provider"
}
module "scope-mappings" {
    source = "../../../../modules/scope-mappings"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    client_id = keycloak_openid_client.CLIENT.id
    roles = {
		"account/view-profile" = var.account.ROLES["view-profile"].id,
		"PIDP-SERVICE/feature_pidp_demo" = var.PIDP-SERVICE.ROLES["feature_pidp_demo"].id,
		"PIDP-SERVICE/USER" = var.PIDP-SERVICE.ROLES["USER"].id,
		"PIDP-SERVICE/feature_amh_demo" = var.PIDP-SERVICE.ROLES["feature_amh_demo"].id,
		"PIDP-SERVICE/ADMIN" = var.PIDP-SERVICE.ROLES["ADMIN"].id,
	}
}
