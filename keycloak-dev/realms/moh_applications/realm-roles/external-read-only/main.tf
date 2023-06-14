resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.realm-management.ROLES["query-clients"].id,
    var.realm-management.ROLES["query-realms"].id,
    var.realm-management.ROLES["query-users"].id,
    var.realm-management.ROLES["view-clients"].id,
    var.realm-management.ROLES["view-identity-providers"].id,
    var.realm-management.ROLES["view-users"].id,
  ]
  description = "Role for external (non CGI) users to be able to have a read only view of the moh applications realm"
  name        = "External Read Only"
  realm_id    = "moh_applications"
}
