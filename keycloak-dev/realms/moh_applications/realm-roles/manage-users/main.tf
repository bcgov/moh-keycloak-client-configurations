resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.USER-MANAGEMENT-SERVICE.ROLES["bulk-removal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-all-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-org"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-bcer-cp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-dmft-webapp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-emcod"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hd2"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-licence-status"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-maid"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pho-rsc"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prp-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-dbaac-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-hibc-service-bc-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-sfdc"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
    var.USER-MANAGEMENT.ROLES["user-management-admin"].id,
  ]
  description = "Provides the roles required to manage users using the USER-MANAGEMENT application including roles for all applications.  In DEV this role is provided to the Developer and AM teams."
  name        = "Manage Users"
  realm_id    = "moh_applications"
}
