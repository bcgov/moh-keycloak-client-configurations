resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "ITSB Access Team"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-org"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-own-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-alr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-bcer-cp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-fmdb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hscis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-icy"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-maid"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-dbaac-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-hibc-service-bc-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-sfdc"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sfds"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-tap"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id
  ]
}
