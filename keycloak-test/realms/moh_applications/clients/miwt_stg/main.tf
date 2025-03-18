module "payara-client" {
  source      = "../../../../../modules/payara-client"
  mapper_name = "MIWT Role"
  claim_name  = "miwt_role"
  client_id   = "MIWT_STG"
  base_url    = "https://miwtstg.hlth.gov.bc.ca/MedicalImaging"
  description = "The Medical Imaging Wait Times application allows the Ministry of Health (MoH) to track the wait times for various medical imaging procedure at different facilities in BC."
  client_name = "MIWT_STG"
  roles = {
    "MEDIMADMIN" = {
      "name" = "MEDIMADMIN"
    },
    "MEDIMGA_HA_FRASER" = {
      "name" = "MEDIMGA_HA_FRASER"
    },
    "MEDIMGA_HA_INTERIOR" = {
      "name" = "MEDIMGA_HA_INTERIOR"
    },
    "MEDIMGA_HA_NORTHERN" = {
      "name" = "MEDIMGA_HA_NORTHERN"
    },
    "MEDIMGA_HA_PHSA" = {
      "name" = "MEDIMGA_HA_PHSA"
    },
    "MEDIMGA_HA_VAN_COSTL" = {
      "name" = "MEDIMGA_HA_VAN_COSTL"
    },
    "MEDIMGA_HA_VAN_ISLD" = {
      "name" = "MEDIMGA_HA_VAN_ISLD"
    },
    "MEDIMSTAFF" = {
      "name" = "MEDIMSTAFF"
    },
  }
  service_accounts_enabled           = false
  use_refresh_tokens                 = false
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  valid_redirect_uris = [
    "https://sts.healthbc.org/adfs/ls/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://miwtstg.hlth.gov.bc.ca/*",
  ]
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = false
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "IDP"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "identity_provider"
}

resource "keycloak_generic_client_protocol_mapper" "phsa_windowsaccountname" {
  realm_id        = module.payara-client.CLIENT.realm_id
  client_id       = module.payara-client.CLIENT.id
  name            = "preferred_username"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-override-usermodel-attribute-mapper"
  config = {
    "userinfo.token.claim" : "false",
    "user.attribute" : "phsa_windowsaccountname",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "preferred_username",
    "jsonType.label" : "String",
    "introspection.token.claim" = "false"
  }
}
