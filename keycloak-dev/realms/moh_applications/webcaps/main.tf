resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = "https://devpublic.healthideas.gov.bc.ca"
  client_authenticator_type           = "client-secret"
  client_id                           = "WEBCAPS"
  consent_required                    = false
  description                         = "WebCAPS is a web application under the HealthIdeas Portfolio."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "WebCAPS"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:7780/*",
    "https://localhost:7780/*",
    "https://devpublic.healthideas.gov.bc.ca/*",
    "https://uatpublic.healthideas.gov.bc.ca/*",
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "DATA_HA_01" = {
      "name"        = "DATA_HA_01"
      "description" = "This is an example description"
    },
    "DATA_HA_02" = {
      "name"        = "DATA_HA_02"
      },
    "DATA_HA_03" = {
      "name"        = "DATA_HA_03"
      },
    "DATA_HA_04" = {
      "name"        = "DATA_HA_04"
      },
    "DATA_HA_05" = {
      "name"        = "DATA_HA_05"
      },
    "DATA_HA_08" = {
      "name"        = "DATA_HA_08"
      },
    "DATA_HA_20" = {
      "name"        = "DATA_HA_20"
      },
    "DATA_HA_CRF" = {
      "name"        = "DATA_HA_CRF"
      },
    "DATA_HA_NVHB" = {
      "name"        = "DATA_HA_NVHB"
      },
    "DATA_HA_PROV" = {
      "name"        = "DATA_HA_PROV"
      },
    "DATA_HA_SNHA" = {
      "name"        = "DATA_HA_SNHA"
      },
    "DATA_HA_Z_UN" = {
      "name"        = "DATA_HA_Z_UN"
      },
    "HAUSER" = {
      "name"        = "HAUSER"
      },
    "HAUSERPRIV" = {
      "name"        = "HAUSERPRIV"
      },
    "MINUSER" = {
      "name"        = "MINUSER"
      },
    "MINUSERPRIV" = {
      "name"        = "MINUSERPRIV"
      },
    "SYSADMIN" = {
      "name"        = "SYSADMIN"
      },
  }
}
resource "keycloak_openid_user_attribute_protocol_mapper" "idir_user_guid" {
  add_to_id_token = false
  add_to_userinfo = false
  claim_name      = "idir_user_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_user_guid"
  user_attribute  = "idir_user_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}
