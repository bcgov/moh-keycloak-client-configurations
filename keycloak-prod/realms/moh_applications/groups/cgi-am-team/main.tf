resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "CGI Access Management Team"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.MANAGE-USERS.REALM_ROLE.id
  ]
}
