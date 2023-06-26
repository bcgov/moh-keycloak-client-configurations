resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "Registries Access Team"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.realm-management.ROLES["manage-users"].id,
    var.realm-management.ROLES["query-clients"].id,
    var.realm-management.ROLES["view-events"].id,
    var.realm-management.ROLES["view-users"].id
  ]
}
