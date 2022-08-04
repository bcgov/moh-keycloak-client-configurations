resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "CONFIDENTIAL"
    base_url    = "https://hoopc.hlth.gov.bc.ca"
    client_authenticator_type = "client-secret"
    client_id   = "HOOPC"
    consent_required = false
    description = "Hospital Out Of Province Claims"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "HOOPC"
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://hoopc.hlth.gov.bc.ca/*",
	]
    web_origins = [
	]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
    add_to_id_token = false
    claim_name = "identity_provider"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "IDP"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "identity_provider"
}
