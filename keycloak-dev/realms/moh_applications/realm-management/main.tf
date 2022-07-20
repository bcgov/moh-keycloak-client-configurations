data "keycloak_openid_client" "CLIENT" {
    realm_id = "moh_applications"
    client_id = "realm-management"
}
module "client-roles-data-source" {
    source = "../../../../modules/client-roles-data-source"
    client_id = data.keycloak_openid_client.CLIENT.id
    realm_id = data.keycloak_openid_client.CLIENT.realm_id
    roles = {
		"manage-users" = "manage-users",
		"manage-identity-providers" = "manage-identity-providers",
		"manage-events" = "manage-events",
		"query-clients" = "query-clients",
		"query-users" = "query-users",
		"view-users" = "view-users",
		"manage-clients" = "manage-clients",
		"view-realm" = "view-realm",
		"manage-realm" = "manage-realm",
		"impersonation" = "impersonation",
		"view-authorization" = "view-authorization",
		"view-identity-providers" = "view-identity-providers",
		"query-groups" = "query-groups",
		"create-client" = "create-client",
		"realm-admin" = "realm-admin",
		"query-realms" = "query-realms",
		"view-clients" = "view-clients",
		"view-events" = "view-events",
		"manage-authorization" = "manage-authorization",
	}
}
