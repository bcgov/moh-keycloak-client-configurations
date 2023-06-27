resource "keycloak_group" "GROUP" {
  realm_id = "moh_applications"
  name     = "PLR Management"
}

resource "keycloak_group_roles" "GROUP_ROLES" {
  realm_id = keycloak_group.GROUP.realm_id
  group_id = keycloak_group.GROUP.id

  role_ids = [
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-own-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_conf"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_flvr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_iat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_rev"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_sit"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_stg"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_uat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id
  ]
}
