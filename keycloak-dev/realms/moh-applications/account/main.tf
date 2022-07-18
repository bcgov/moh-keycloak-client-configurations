data "keycloak_openid_client" "CLIENT" {
    realm_id = "moh_applications"
    client_id = "account"
}
module "client-roles-data-source" {
    source = "../../../../modules/client-roles-data-source"
    client_id = data.keycloak_openid_client.CLIENT.id
    realm_id = data.keycloak_openid_client.CLIENT.realm_id
    roles = {
		"manage-consent" = "manage-consent",
		"view-applications" = "view-applications",
		"delete-account" = "delete-account",
		"manage-account-links" = "manage-account-links",
		"view-profile" = "view-profile",
		"manage-account" = "manage-account",
		"view-consent" = "view-consent",
	}
}
