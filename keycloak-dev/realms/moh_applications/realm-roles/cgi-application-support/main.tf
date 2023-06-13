resource "keycloak_role" "REALM_ROLE" {
  realm_id    = "moh_applications"
  name        = "CGI Application Support"
  description = "Provides the top level of access to all CGI managed applications. In DEV this role is provided to the Developer, Midtier, and QA teams."
  composite_roles = [
    var.HEM.ROLES["hem"].id,
    var.MSPDIRECT-SERVICE.ROLES["E45"].id,
    var.HCIMWEB_HD2.ROLES["REG_ADMIN_HCIM"].id,
    var.BCER-CP.ROLES["bcer_admin"].id,
    var.PLR.ROLES["REG_ADMIN"].id,
    var.MSPDIRECT-SERVICE.ROLES["TRAININGHEALTHAUTH"].id,
    var.HCIMWEB.ROLES["REG_ADMIN_HCIM"].id,
  ]
}
