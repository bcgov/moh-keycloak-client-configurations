resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.USER-MANAGEMENT-SERVICE.ROLES["bulk-removal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-all-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-org"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-alr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-bcer-cp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-dhiper"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-dmft-webapp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-eacl_stg"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-edrd"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-edrd-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-emcod"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-fmdb"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-gis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hamis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcap-fe"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat1"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat2"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hiat3"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hs1"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_hsit"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_huat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-health-ideas"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hem"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hscis"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hsiar"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hspp"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-icy"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-licence-status"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-maid"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-miwt_stg"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-mspdirect-service-uat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-phlat-web"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-phlat_stg-web"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_conf"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_flvr"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_iat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_rev"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_sit"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_stg"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-plr_uat"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-primary-care"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prime-application-local"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prime-application-test"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prp-service"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-dbaac-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-hibc-service-bc-portal"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sa-sfdc"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sat-eforms"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sfds"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-swt_stg"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-tap"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-tbcm"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-tpl"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-client-webcaps"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-events"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-groups"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-metrics"].id,
    var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
    var.USER-MANAGEMENT.ROLES["user-management-admin"].id,
  ]
  description = "Provides the roles required to manage users using the USER-MANAGEMENT application including roles for all applications. In TEST this role is provided to the Developer and AM teams."
  name        = "Manage Users"
  realm_id    = "moh_applications"
}
