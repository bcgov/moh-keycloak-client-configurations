resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "CGI Registries"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.HCIMWEB_HIAT1.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HIAT2.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HIAT3.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HS1.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HSIT.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HUAT.ROLES["REG_ADMIN_HCIM"].id
  ]
}
