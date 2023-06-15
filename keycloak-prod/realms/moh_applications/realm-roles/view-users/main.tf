resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-bcer-cp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-fmdb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-gis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hem"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hscis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-maid"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-dbaac-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-hibc-service-bc-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-sfdc"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sfds"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
  ]
  description = "View-only role for User Management Console"
  name        = "View Users"
  realm_id    = "moh_applications"
}
