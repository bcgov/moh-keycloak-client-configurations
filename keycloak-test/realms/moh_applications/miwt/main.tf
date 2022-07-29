module "payara-client" {
	source = "../../../../modules/payara-client"
	mapper_name = "MIWT Role"
	claim_name  = "miwt_role"
	client_id   = "MIWT"
	base_url    = "https://miwtuat.hlth.gov.bc.ca/MedicalImaging"
	description = "Medical Imaging Wait Times"
	client_name = "MIWT"
	roles = {	
        "MEDIMADMIN" = {
            "name" = "MEDIMADMIN"
            "description" = ""
        },
        "MEDIMGA_HA_VAN_COSTL" = {
            "name" = "MEDIMGA_HA_VAN_COSTL"
            "description" = ""
        },
        "MEDIMGA_HA_VAN_ISLD" = {
            "name" = "MEDIMGA_HA_VAN_ISLD"
            "description" = ""
        },
        "MEDIMGA_HA_FRASER" = {
            "name" = "MEDIMGA_HA_FRASER"
            "description" = ""
        },
        "MEDIMGA_HA_INTERIOR" = {
            "name" = "MEDIMGA_HA_INTERIOR"
            "description" = ""
        },
        "MEDIMSTAFF" = {
            "name" = "MEDIMSTAFF"
            "description" = ""
        },
        "MEDIMGA_HA_NORTHERN" = {
            "name" = "MEDIMGA_HA_NORTHERN"
            "description" = ""
        },
        "MEDIMGA_HA_PHSA" = {
            "name" = "MEDIMGA_HA_PHSA"
            "description" = ""
        },
	}
	service_accounts_enabled = false
	valid_redirect_uris = [
		"https://miwtuat.hlth.gov.bc.ca/*",
		"https://sts.healthbc.org/adfs/ls/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
	]
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
