resource "keycloak_role" "REALM_ROLE" {
  composite_roles = [
    var.BCER-CP.ROLES["bcer_admin"].id,
    var.EACL.ROLES["Super_Sysadmin"].id,
    var.EACL_STG.ROLES["Super_Sysadmin"].id,
    var.FMDB.ROLES["PSDADMIN"].id,
    var.GIS.ROLES["GISUSER"].id,
    var.HAMIS.ROLES["HMS_ADMIN"].id,
    var.HCIMWEB_HIAT1.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HIAT2.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HIAT3.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HS1.ROLES["REG_ADMIN_HCIM"].id,
    var.HCIMWEB_HUAT.ROLES["REG_ADMIN_HCIM"].id,
    var.HEM.ROLES["hem"].id,
    var.MIWT.ROLES["MEDIMADMIN"].id,
    var.MIWT_STG.ROLES["MEDIMADMIN"].id,
    var.MSPDIRECT-SERVICE-UAT.ROLES["TRAININGHEALTHAUTH"].id,
    var.MSPDIRECT-SERVICE.ROLES["TRAININGHEALTHAUTH"].id,
    var.SFDS.ROLES["ADMIN"].id,
    var.SWT.ROLES["Administrator"].id,
    var.SWT_STG.ROLES["Administrator"].id,
    var.TAP.ROLES["TAPUSER"].id,
  ]
  description = "Provides the top level of access to all CGI managed applications. In TEST this role is provided to the Developer, Midtier, and QA teams."
  name        = "CGI Application Support"
  realm_id    = "moh_applications"
}
