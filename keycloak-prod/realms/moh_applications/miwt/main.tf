module "payara-client" {
	source = "../../../../modules/payara-client"
	claim_name  = "miwt_role"
	client_id   = "MIWT"
    mapper_name = "MIWT Role"
	base_url    = "https://miwt.hlth.gov.bc.ca/MedicalImaging"
	description = "Medical Imaging Wait Times"
	valid_redirect_uris = [
		"https://miwt.hlth.gov.bc.ca/*",
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
	]
	roles = {	
        "MEDIMGA_HA_INTERIOR" = {
            "name" = "MEDIMGA_HA_INTERIOR"
            "description" = ""
        },
        "MEDIMGA_HA_NORTHERN" = {
            "name" = "MEDIMGA_HA_NORTHERN"
            "description" = ""
        },
        "MEDIMADMIN" = {
            "name" = "MEDIMADMIN"
            "description" = ""
        },
        "MEDIMGA_HA_VAN_COSTL" = {
            "name" = "MEDIMGA_HA_VAN_COSTL"
            "description" = ""
        },
        "MEDIMSTAFF" = {
            "name" = "MEDIMSTAFF"
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
	}
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
    add_to_id_token = false
    claim_name = "identity_provider"
    claim_value_type = "String"
    client_id = module.payara-client.CLIENT.id
    name = "IDP"
    realm_id = module.payara-client.CLIENT.realm_id
    session_note = "identity_provider"
}
