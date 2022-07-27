resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "CONFIDENTIAL"
    backchannel_logout_session_required = false
    base_url    = "https://miwtstg.hlth.gov.bc.ca/MedicalImaging"
    client_authenticator_type = "client-secret"
    client_id   = "MIWT_STG"
    consent_required = false
    description = "Medical Imaging Wait Times"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "MIWT_STG"
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    use_refresh_tokens = false
    valid_redirect_uris = [
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://miwtstg.hlth.gov.bc.ca/*",
	]
    web_origins = [
	]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "MEDIMGA_HA_VAN_COSTL" = {
            "name" = "MEDIMGA_HA_VAN_COSTL"
            "description" = ""
        },
        "MEDIMGA_HA_INTERIOR" = {
            "name" = "MEDIMGA_HA_INTERIOR"
            "description" = ""
        },
        "MEDIMGA_HA_FRASER" = {
            "name" = "MEDIMGA_HA_FRASER"
            "description" = ""
        },
        "MEDIMGA_HA_PHSA" = {
            "name" = "MEDIMGA_HA_PHSA"
            "description" = ""
        },
        "MEDIMGA_HA_VAN_ISLD" = {
            "name" = "MEDIMGA_HA_VAN_ISLD"
            "description" = ""
        },
        "MEDIMGA_HA_NORTHERN" = {
            "name" = "MEDIMGA_HA_NORTHERN"
            "description" = ""
        },
        "MEDIMSTAFF" = {
            "name" = "MEDIMSTAFF"
            "description" = ""
        },
        "MEDIMADMIN" = {
            "name" = "MEDIMADMIN"
            "description" = ""
        },
	}
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
