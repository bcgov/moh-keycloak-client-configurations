module "payara_client" {
	 source = "../../../../modules/payara-client"
	 claim_name  = "miwt_role"
	 client_id   = "MIWT"
	 base_url    = "https://miwtd.hlth.gov.bc.ca/MedicalImaging"
	 description = "Medical Imaging Wait Times"
	 valid_redirect_uris = [
		"http://localhost:8080/*",
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://qa-sts.healthbc.org/adfs/ls/*",
		"https://miwtd.hlth.gov.bc.ca/*",
		"https://localhost:8081/*",
	]
	 roles = {
		 "MEDIMSTAFF" = {
			 "name"        = "MEDIMSTAFF"
			 "description" = ""
		},
		 "MEDIMADMIN" = {
			 "name"        = "MEDIMADMIN"
			 "description" = ""
		},
		 "MEDIMGA_HA_FRASER" = {
			 "name"        = "MEDIMGA_HA_FRASER"
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
		 "MEDIMGA_HA_INTERIOR" = {
			 "name"        = "MEDIMGA_HA_INTERIOR"
			 "description" = ""
		},
		 "MEDIMGA_HA_VAN_ISLD" = {
			 "name"        = "MEDIMGA_HA_VAN_ISLD"
			 "description" = ""
		},
		 "MEDIMGA_HA_NORTHERN" = {
			 "name"        = "MEDIMGA_HA_NORTHERN"
			 "description" = ""
		},
	}
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
	realm_id  = module.payara_client.CLIENT.realm_id
	client_id = module.payara_client.CLIENT.id
	name = "IDP"
	claim_name = "identity_provider"
	claim_value_type = "String"
	session_note = "identity_provider"
	add_to_id_token = false
}
