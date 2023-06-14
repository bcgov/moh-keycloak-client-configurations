module "CGI-APPLICATION-SUPPORT" {
  source                = "./realm-roles/cgi-application-support"
  BCER-CP               = module.BCER-CP
  EACL                  = module.EACL
  EACL_STG              = module.EACL_STG
  FMDB                  = module.FMDB
  GIS                   = module.GIS
  HAMIS                 = module.HAMIS
  HCIMWEB_HIAT1         = module.HCIMWEB_HIAT1
  HCIMWEB_HIAT2         = module.HCIMWEB_HIAT2
  HCIMWEB_HIAT3         = module.HCIMWEB_HIAT3
  HCIMWEB_HS1           = module.HCIMWEB_HS1
  HCIMWEB_HUAT          = module.HCIMWEB_HUAT
  HEM                   = module.HEM
  MIWT                  = module.MIWT
  MIWT_STG              = module.MIWT_STG
  MSPDIRECT-SERVICE     = module.MSPDIRECT-SERVICE
  MSPDIRECT-SERVICE-UAT = module.MSPDIRECT-SERVICE-UAT
  SFDS                  = module.SFDS
  SWT                   = module.SWT
  SWT_STG               = module.SWT_STG
  TAP                   = module.TAP
}
module "MANAGE-REALM" {
  source           = "./realm-roles/manage-realm"
  realm-management = module.realm-management
}
module "MANAGE-USERS" {
  source                  = "./realm-roles/manage-users"
  USER-MANAGEMENT         = module.USER-MANAGEMENT
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}