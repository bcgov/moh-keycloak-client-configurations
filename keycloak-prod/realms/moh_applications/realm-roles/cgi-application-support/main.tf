resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.BCER-CP.ROLES["bcer_admin"].id,
    var.EACL.ROLES["Super_Sysadmin"].id,
    var.FMDB.ROLES["MOHUSER"].id,
    var.HEM.ROLES["hem"].id,
    var.MIWT.ROLES["MEDIMADMIN"].id,
    var.MSPDIRECT-SERVICE.ROLES["TRAININGHEALTHAUTH"].id,
    var.SFDS.ROLES["ADMIN"].id,
    var.SWT.ROLES["Administrator"].id,
  ]
  description = "Provides the top level of access to all CGI managed applications."
  name        = "CGI Application Support"
  realm_id    = "moh_applications"
}
