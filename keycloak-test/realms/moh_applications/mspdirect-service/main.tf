resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "BEARER-ONLY"
    base_url    = ""
    client_authenticator_type = "client-secret"
    client_id   = "MSPDIRECT-SERVICE"
    consent_required = false
    description = "MSP Direct APIs"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "MSPDirect Test API"
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = false
    valid_redirect_uris = [
	]
    web_origins = [
	]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "PBFUSER" = {
            "name" = "PBFUSER"
            "description" = ""
        },
        "VISARESIDENT" = {
            "name" = "VISARESIDENT"
            "description" = ""
        },
        "TRAININGHEALTHAUTH" = {
            "name" = "TRAININGHEALTHAUTH"
            "description" = ""
        },
        "ELIGIBILITY" = {
            "name" = "ELIGIBILITY"
            "description" = ""
        },
        "E45" = {
            "name" = "E45"
            "description" = ""
        },
        "PREMIUMADMIN" = {
            "name" = "PREMIUMADMIN"
            "description" = ""
        },
        "PREMIUMADMINPLUS" = {
            "name" = "PREMIUMADMINPLUS"
            "description" = ""
        },
	}
}