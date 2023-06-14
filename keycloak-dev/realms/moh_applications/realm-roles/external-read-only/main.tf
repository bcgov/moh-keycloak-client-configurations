resource "keycloak_role" "REALM_ROLE" {
  realm_id    = "moh_applications"
  name        = "External Read Only"
  description = "Role for external (non CGI) users to be able to have a read only view of the moh applications realm"
  composite_roles = [
    var.realm-management.ROLES["query-clients"].id,
    var.realm-management.ROLES["query-realms"].id,
    var.realm-management.ROLES["query-users"].id,
    var.realm-management.ROLES["view-clients"].id,
    var.realm-management.ROLES["view-identity-providers"].id,
    var.realm-management.ROLES["view-users"].id,
  ]
}
