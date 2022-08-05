resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = "1800"
    access_type = "PUBLIC"
    backchannel_logout_session_required = true
    base_url    = "https://pharmanetenrolment.gov.bc.ca/gis"
    client_authenticator_type = "client-secret"
    client_id   = "PRIME-WEBAPP-ENROLLMENT"
    consent_required = false
    description = ""
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = ""
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    valid_redirect_uris = [
		"*",
	]
    web_origins = [
		"*",
	]
}
resource "keycloak_openid_audience_protocol_mapper" "Prime-Audience-Mapper" {
    add_to_id_token = false
    client_id = keycloak_openid_client.CLIENT.id
    included_custom_audience = "prime-web-api"
    name = "Prime Audience Mapper"
    realm_id = keycloak_openid_client.CLIENT.realm_id
}
