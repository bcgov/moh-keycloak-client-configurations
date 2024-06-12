module "CGI-APPLICATION-SUPPORT" {
  source            = "./realm-roles/cgi-application-support"
  BCER-CP           = module.BCER-CP
  HCIMWEB           = module.HCIMWEB
  HCIMWEB_HD2       = module.HCIMWEB_HD2
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
  PLR               = module.PLR
}
module "EXTERNAL-READ-ONLY" {
  source           = "./realm-roles/external-read-only"
  realm-management = module.realm-management
}
module "MANAGE-USERS" {
  source                  = "./realm-roles/manage-users"
  USER-MANAGEMENT         = module.USER-MANAGEMENT
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}