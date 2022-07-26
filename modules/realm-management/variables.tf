variable "roles" {
  type = map(string)
  default ={
	"realm-admin" = "realm-admin",
	"manage-identity-providers" = "manage-identity-providers",
	"view-clients" = "view-clients",
	"manage-realm" = "manage-realm",
	"query-realms" = "query-realms",
	"view-identity-providers" = "view-identity-providers",
	"manage-users" = "manage-users",
	"create-client" = "create-client",
	"query-users" = "query-users",
	"manage-events" = "manage-events",
	"query-clients" = "query-clients",
	"view-events" = "view-events",
	"view-users" = "view-users",
	"view-realm" = "view-realm",
	"impersonation" = "impersonation",
	"view-authorization" = "view-authorization",
	"manage-clients" = "manage-clients",
	"query-groups" = "query-groups",
	"manage-authorization" = "manage-authorization",
	}
}