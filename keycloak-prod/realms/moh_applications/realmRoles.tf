module "CGI-APPLICATION-SUPPORT" {
  source            = "./realm-roles/cgi-application-support"
  BCER-CP           = module.BCER-CP
  EACL              = module.EACL
  FMDB              = module.FMDB
  HEM               = module.HEM
  MIWT              = module.MIWT
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
  SFDS              = module.SFDS
  SWT               = module.SWT
}
module "MANAGE-USERS" {
  source                  = "./realm-roles/manage-users"
  USER-MANAGEMENT         = module.USER-MANAGEMENT
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "VIEW-USERS" {
  source                  = "./realm-roles/view-users"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}