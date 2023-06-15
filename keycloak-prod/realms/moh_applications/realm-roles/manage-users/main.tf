resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-all-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-org"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
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
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prime-application"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sfds"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-tap"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
    var.USER-MANAGEMENT.ROLES["user-management-admin"].id,
  ]
  description = "Provides the roles required to manage users using the USER-MANAGEMENT application including roles for all applications. In PROD this role is not provided to specific teams."
  name        = "Manage Users"
  realm_id    = "moh_applications"
}
