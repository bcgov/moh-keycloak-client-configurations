resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.realm-management.ROLES["create-client"].id,
    var.realm-management.ROLES["manage-authorization"].id,
    var.realm-management.ROLES["manage-clients"].id,
    var.realm-management.ROLES["manage-events"].id,
    var.realm-management.ROLES["manage-identity-providers"].id,
    var.realm-management.ROLES["manage-realm"].id,
    var.realm-management.ROLES["manage-users"].id,
    var.realm-management.ROLES["query-clients"].id,
    var.realm-management.ROLES["query-groups"].id,
    var.realm-management.ROLES["query-realms"].id,
    var.realm-management.ROLES["query-users"].id,
    var.realm-management.ROLES["view-authorization"].id,
    var.realm-management.ROLES["view-clients"].id,
    var.realm-management.ROLES["view-events"].id,
    var.realm-management.ROLES["view-identity-providers"].id,
    var.realm-management.ROLES["view-realm"].id,
    var.realm-management.ROLES["view-users"].id,
  ]
  description = "Provides the required ream-management roles to manage all aspects of this realm. In TEST this role is provided to the Developer and Midtier teams."
  name        = "Manage Realm"
  realm_id    = "moh_applications"
}
