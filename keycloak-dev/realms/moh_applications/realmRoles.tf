module "CGI-APPLICATION-SUPPORT" {
  source            = "./realm-roles/cgi-application-support"
  BCER-CP           = module.BCER-CP
  HEM               = module.HEM
  HCIMWEB_HD2       = module.HCIMWEB_HD2
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
  HCIMWEB           = module.HCIMWEB
  PLR               = module.PLR
}
module "EXTERNAL-READ-ONLY" {
  source           = "./realm-roles/external-read-only"
  realm-management = module.realm-management
}
module "MANAGE-REALM" {
  source           = "./realm-roles/manage-realm"
  realm-management = module.realm-management
}
module "MANAGE-USERS" {
  source                  = "./realm-roles/manage-users"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  USER-MANAGEMENT         = module.USER-MANAGEMENT
}