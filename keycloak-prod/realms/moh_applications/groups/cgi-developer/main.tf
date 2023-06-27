resource "keycloak_group" "GROUP" {
  realm_id   = "moh_applications"
  name       = "CGI Developer"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.FMDB.ROLES["PSDADMIN"].id,
var.GIS.ROLES["GISUSER"].id,
var.HAMIS.ROLES["HMS_ADMIN"].id,
var.HEM.ROLES["hem"].id,
var.HSCIS.ROLES["ADMIN"].id,
var.MANAGE-USERS.REALM_ROLE.id,
var.MIWT.ROLES["MEDIMADMIN"].id,
var.SFDS.ROLES["ADMIN"].id,
var.SWT.ROLES["Administrator"].id,
var.TAP.ROLES["TAPUSER"].id,
var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
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
