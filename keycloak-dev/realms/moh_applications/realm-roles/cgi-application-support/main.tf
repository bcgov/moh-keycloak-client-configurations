resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.BCER-CP.ROLES["bcer_admin"].id,
    var.HCIMWEB.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HD2.ROLES["REG_ADMIN_HCIM"].id,
    var.MSPDIRECT-SERVICE.ROLES["E45"].id,
    var.MSPDIRECT-SERVICE.ROLES["TRAININGHEALTHAUTH"].id,
    var.PLR.ROLES["REG_ADMIN"].id,
  ]
  description = "Provides the top level of access to all CGI managed applications. In DEV this role is provided to the Developer, Midtier, and QA teams."
  name        = "CGI Application Support"
  realm_id    = "moh_applications"
}
