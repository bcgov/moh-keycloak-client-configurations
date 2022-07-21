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
		"manage-account-links" = "manage-account-links",
		"manage-account" = "manage-account",
		"delete-account" = "delete-account",
		"view-profile" = "view-profile",
		"view-applications" = "view-applications",
		"view-consent" = "view-consent",
	}
}
