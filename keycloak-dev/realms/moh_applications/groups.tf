module "CGI-AM-TEAM" {
  source       = "./groups/cgi-am-team"
  MANAGE-USERS = module.MANAGE-USERS
}
module "CGI-DBA" {
  source                  = "./groups/cgi-dba"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
}
module "CGI-DEVELOPER" {
  source                  = "./groups/cgi-developer"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  MANAGE-USERS            = module.MANAGE-USERS
}
module "CGI-MID-TIER" {
  source                  = "./groups/cgi-mid-tier"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
}
module "CGI-QA" {
  source                  = "./groups/cgi-qa"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
}
module "EMCOD-HELP-DESK" {
  source                  = "./groups/emcod-help-desk"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "ITSB-ACCESS-TEAM" {
  source                  = "./groups/itsb-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PHO-RSC-MANAGEMENT" {
  source                  = "./groups/pho-rsc-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-MANAGEMENT" {
  source                  = "./groups/pidp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "SAT-ACCESS-MANAGEMENT" {
  source                  = "./groups/sat-access-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "WEBCAPS-USER-ADMIN" {
  source                  = "./groups/webcaps-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}