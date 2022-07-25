resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "CONFIDENTIAL"
    admin_url   = ""
    backchannel_logout_session_required = true
    base_url    = "https://hcimweb-hd4.hlth.gov.bc.ca/HCIMWeb"
    client_authenticator_type = "client-secret"
    client_id   = "HCIMWEB"
    consent_required = false
    description = "HCIM Web App"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "HCIMWEB"
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    use_refresh_tokens = true
    valid_redirect_uris = [
		"https://hcimweb-dev-cl.hlth.gov.bc.ca/*",
		"http://localhost:8080/*",
		"https://hcimweb-hd2.hlth.gov.bc.ca/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://qa-sts.healthbc.org/adfs/ls/*",
		"https://hcimweb-hd1.hlth.gov.bc.ca/*",
		"https://hcimweb-hd4.hlth.gov.bc.ca/*",
		"https://localhost:8081/*",
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
        "READ_ONLY_ALL_SRC" = {
            "name" = "READ_ONLY_ALL_SRC"
            "description" = ""
        },
        "MAINTR_FULL" = {
            "name" = "MAINTR_FULL"
            "description" = ""
        },
        "MAINTR_UPDT" = {
            "name" = "MAINTR_UPDT"
            "description" = ""
        },
        "REGR_UPDT_ADDR_ONLY" = {
            "name" = "REGR_UPDT_ADDR_ONLY"
            "description" = ""
        },
        "MAINTR_READ_ONLY" = {
            "name" = "MAINTR_READ_ONLY"
            "description" = ""
        },
        "HIBC_REG_NEWBORN" = {
            "name" = "HIBC_REG_NEWBORN"
            "description" = ""
        },
        "REG_ADMIN_HCIM" = {
            "name" = "REG_ADMIN_HCIM"
            "description" = ""
        },
        "REGR_UPDT" = {
            "name" = "REGR_UPDT"
            "description" = ""
        },
        "REGR_LTD" = {
            "name" = "REGR_LTD"
            "description" = ""
        },
        "REG_INTEGRITY_CLERK" = {
            "name" = "REG_INTEGRITY_CLERK"
            "description" = ""
        },
        "REGR_FULL" = {
            "name" = "REGR_FULL"
            "description" = ""
        },
	}
}
resource "keycloak_openid_user_attribute_protocol_mapper" "org_details" {
    add_to_id_token = false
    add_to_userinfo = false
    claim_name = "org_details"
    client_id = keycloak_openid_client.CLIENT.id
    name = "org_details"
    user_attribute = "org_details"
    realm_id = keycloak_openid_client.CLIENT.realm_id
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
