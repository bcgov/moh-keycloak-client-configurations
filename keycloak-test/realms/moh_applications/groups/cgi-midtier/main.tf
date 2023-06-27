resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "CGI Midtier"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.CGI-APPLICATION-SUPPORT.REALM_ROLE.id,
    var.HEM.ROLES["hem"].id,
    var.MANAGE-USERS.REALM_ROLE.id,
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
    var.realm-management.ROLES["view-users"].id
  ]
}
