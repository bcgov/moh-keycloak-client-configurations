module "MIWT" {
  source = "../../../modules/payara-client"

  client_id   = "MIWT"
  claim_name  = "miwt_role"
  base_url    = "https://miwtuat.hlth.gov.bc.ca/MedicalImaging"
  description = "Medical Imaging Wait Times"
  valid_redirect_uris = [
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
    "https://miwtuat.hlth.gov.bc.ca/*",
  ]
  roles = {
    "MEDIMADMIN" = {
      "name"        = "MEDIMADMIN"
      "description" = ""
    },
    "MEDIMGA_HA_FRASER" = {
      "name"        = "MEDIMGA_HA_FRASER"
      "description" = ""
    },
    "MEDIMGA_HA_INTERIOR" = {
      "name"        = "MEDIMGA_HA_INTERIOR"
      "description" = ""
    },
    "MEDIMGA_HA_NORTHERN" = {
      "name"        = "MEDIMGA_HA_NORTHERN"
      "description" = ""
    },
    "MEDIMGA_HA_PHSA" = {
      "name"        = "MEDIMGA_HA_PHSA"
      "description" = ""
    },
    "MEDIMGA_HA_VAN_COSTL" = {
      "name"        = "MEDIMGA_HA_VAN_COSTL"
      "description" = ""
    },
    "MEDIMGA_HA_VAN_ISLD" = {
      "name"        = "MEDIMGA_HA_VAN_ISLD"
      "description" = ""
    },
    "MEDIMSTAFF" = {
      "name"        = "MEDIMSTAFF"
      "description" = ""
    }
  }
}
# # https://www.terraform.io/language/values/outputs
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  realm_id  = module.MIWT.CLIENT.realm_id
  name      = "IDP"
  claim_name = "identity_provider"
  client_id = module.MIWT.CLIENT.id
  add_to_id_token     = false
  session_note = "identity_provider"
}