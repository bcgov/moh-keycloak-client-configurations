resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "PUBLIC"
    backchannel_logout_session_required = true
    base_url    = ""
    client_authenticator_type = "client-secret"
    client_id   = "IEN"
    consent_required = false
    description = "Internationally Educated Nurses"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "IEN"
    pkce_code_challenge_method = "S256"
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    valid_redirect_uris = [
		"http://localhost:*",
		"https://dev.ien.freshworks.club/*",
		"https://localhost:*",
	]
    web_origins = [
		"*",
	]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "moh" = {
            "name" = "moh"
            "description" = ""
        },
        "hmbc" = {
            "name" = "hmbc"
            "description" = ""
        },
        "pending" = {
            "name" = "pending"
            "description" = ""
        },
        "ha" = {
            "name" = "ha"
            "description" = ""
        },
	}
}
