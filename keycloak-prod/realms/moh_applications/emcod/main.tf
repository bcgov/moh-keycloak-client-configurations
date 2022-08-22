resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan               = ""
    access_type                         = "PUBLIC"
    backchannel_logout_session_required = true
    base_url                            = ""
    client_authenticator_type           = "client-secret"
    client_id                           = "EMCOD"
    consent_required                    = false
    description                         = "Electronic Medical Certificate of Dying (Vital Stats)"
    direct_access_grants_enabled        = false
    enabled                             = true
    frontchannel_logout_enabled         = false
    full_scope_allowed                  = false
    implicit_flow_enabled               = false
    name                                = "EMCOD"
    pkce_code_challenge_method          = "S256"
    realm_id                            = "moh_applications"
    service_accounts_enabled            = false
    standard_flow_enabled               = true
    use_refresh_tokens                  = true
    valid_redirect_uris                 = [
        "https://emcod.vs.gov.bc.ca/*",
    ]
    web_origins                         = [
        "https://emcod.vs.gov.bc.ca",
        "+",
    ]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "coroner" = {
            "name" = "coroner"
            "description" = ""
        },
        "coroner_clerk" = {
            "name" = "coroner_clerk"
            "description" = ""
        },
    }
}
resource "keycloak_openid_audience_protocol_mapper" "EMCOD-API-aud-mapper" {
    add_to_id_token = false
    client_id = keycloak_openid_client.CLIENT.id
    included_custom_audience = "EMCOD-API"
    name = "EMCOD-API aud mapper"
    realm_id = keycloak_openid_client.CLIENT.realm_id
}
resource "keycloak_openid_user_attribute_protocol_mapper" "idir_user_guid" {
    add_to_id_token = false
    add_to_userinfo = true
    claim_name = "idir_user_guid"
    client_id = keycloak_openid_client.CLIENT.id
    name = "idir_user_guid"
    user_attribute = "idir_user_guid"
    realm_id = keycloak_openid_client.CLIENT.realm_id
}
