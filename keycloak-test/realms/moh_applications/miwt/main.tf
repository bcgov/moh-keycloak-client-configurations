module "payara-client" {
  source                             = "../../../../modules/payara-client"
  base_url                           = "https://miwtuat.hlth.gov.bc.ca/MedicalImaging"
  claim_name                         = "miwt_role"
  client_id                          = "MIWT"
  client_name                        = "MIWT"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Medical Imaging Wait Times application allows the Ministry of Health (MoH) to track the wait times for various medical imaging procedure at different facilities in BC."
  mapper_name                        = "MIWT Role"
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
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://localhost:8081/*",
    "https://miwtd.hlth.gov.bc.ca/*",
    "https://miwtuat.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
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
