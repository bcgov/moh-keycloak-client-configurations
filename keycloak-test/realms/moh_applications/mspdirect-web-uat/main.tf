resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = ""
    access_type = "PUBLIC"
    backchannel_logout_session_required = true
    base_url    = "https://mspdirect-uat.apps.silver.devops.gov.bc.ca/"
    client_authenticator_type = "client-secret"
    client_id   = "MSPDIRECT-WEB-UAT"
    consent_required = false
    description = "MSP Direct Vue Frontend"
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = "MSPDirect UAT"
    pkce_code_challenge_method = "S256"
    realm_id = "moh_applications"
    service_accounts_enabled =false
    standard_flow_enabled = true
    valid_redirect_uris = [
		"https://mspdirect-uat.apps.silver.devops.gov.bc.ca/*",
	]
    web_origins = [
		"*",
	]
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
module "scope-mappings" {
    source = "../../../../modules/scope-mappings"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    client_id = keycloak_openid_client.CLIENT.id
    roles = {
		"MSPDIRECT-SERVICE-UAT/ELIGIBILITY" = var.MSPDIRECT-SERVICE-UAT.ROLES["ELIGIBILITY"].id,
		"MSPDIRECT-SERVICE-UAT/PREMIUMADMINPLUS" = var.MSPDIRECT-SERVICE-UAT.ROLES["PREMIUMADMINPLUS"].id,
		"MSPDIRECT-SERVICE-UAT/PREMIUMADMIN" = var.MSPDIRECT-SERVICE-UAT.ROLES["PREMIUMADMIN"].id,
		"MSPDIRECT-SERVICE-UAT/VISARESIDENT" = var.MSPDIRECT-SERVICE-UAT.ROLES["VISARESIDENT"].id,
		"MSPDIRECT-SERVICE-UAT/TRAININGHEALTHAUTH" = var.MSPDIRECT-SERVICE-UAT.ROLES["TRAININGHEALTHAUTH"].id,
		"MSPDIRECT-SERVICE-UAT/PBFUSER" = var.MSPDIRECT-SERVICE-UAT.ROLES["PBFUSER"].id,
		"MSPDIRECT-SERVICE-UAT/E45" = var.MSPDIRECT-SERVICE-UAT.ROLES["E45"].id,
	}
}
