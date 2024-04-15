module "CGI-DBA" {
  source                  = "./groups/cgi-dba"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  MANAGE-REALM            = module.MANAGE-REALM
  MANAGE-USERS            = module.MANAGE-USERS
}
module "CGI-DEVELOPER" {
  source                  = "./groups/cgi-developer"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HEM                     = module.HEM
  MANAGE-USERS            = module.MANAGE-USERS
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "CGI-MID-TIER" {
  source                  = "./groups/cgi-mid-tier"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HEM                     = module.HEM
  MANAGE-USERS            = module.MANAGE-USERS
}
module "CGI-QA" {
  source                  = "./groups/cgi-qa"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HEM                     = module.HEM
  MANAGE-USERS            = module.MANAGE-USERS
}
module "EMCOD-HELP-DESK" {
  source                  = "./groups/emcod-help-desk"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "ITSB-ACCESS-TEAM" {
  source                  = "./groups/itsb-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "PHO-RSC-MANAGEMENT" {
  source                  = "./groups/pho-rsc-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-MANAGEMENT" {
  source                  = "./groups/pidp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "REGISTRIES-ACCESS-TEAM" {
  source           = "./groups/registries-access-team"
  realm-management = module.realm-management
}
module "SAT-ACCESS-MANAGEMENT" {
  source                  = "./groups/sat-access-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
module "WEBCAPS-USER-ADMIN" {
  source                  = "./groups/webcaps-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}