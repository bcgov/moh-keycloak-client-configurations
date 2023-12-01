module "CGI-DEVELOPER" {
  source                  = "./groups/cgi-developer"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HSCIS                   = module.HSCIS
  MANAGE-USERS            = module.MANAGE-USERS
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}

module "CGI-MIDTIER" {
  source                  = "./groups/cgi-midtier"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HEM                     = module.HEM
  MANAGE-USERS            = module.MANAGE-USERS
  realm-management        = module.realm-management
}

module "CGI-QA" {
  source                  = "./groups/cgi-qa"
  CGI-APPLICATION-SUPPORT = module.CGI-APPLICATION-SUPPORT
  HEM                     = module.HEM
  MANAGE-USERS            = module.MANAGE-USERS
}

module "CGI-REGISTRIES" {
  source        = "./groups/cgi-registries"
  HCIMWEB_HIAT1 = module.HCIMWEB_HIAT1
  HCIMWEB_HIAT2 = module.HCIMWEB_HIAT2
  HCIMWEB_HIAT3 = module.HCIMWEB_HIAT3
  HCIMWEB_HS1   = module.HCIMWEB_HS1
  HCIMWEB_HSIT  = module.HCIMWEB_HSIT
  HCIMWEB_HUAT  = module.HCIMWEB_HUAT
}

module "DHIPER-MANAGEMENT" {
  source                  = "./groups/dhiper-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "EMCOD-ACCESS-TEAM" {
  source                  = "./groups/emcod-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HIBC-ACCESS-MANAGEMENT" {
  source                  = "./groups/hibc-access-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HSIAR-MANAGEMENT" {
  source                  = "./groups/hsiar-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HSPP-MANAGEMENT" {
  source                  = "./groups/hspp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "ITSB-ACCESS-TEAM" {
  source                  = "./groups/itsb-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "MAID-ACCESS-MANAGEMENT" {
  source                  = "./groups/maid-access-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PAS-MANAGEMENT" {
  source                  = "./groups/pas-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PIDP-MANAGEMENT" {
  source                  = "./groups/pidp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PLR-MANAGEMENT" {
  source                  = "./groups/plr-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRIME-MANAGEMENT" {
  source                  = "./groups/prime-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRP-USER-ADMIN" {
  source                  = "./groups/prp-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRIMARY-CARE-ACCESS-TEAM" {
  source                  = "./groups/primary-care-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "REGISTRIES-ADMIN" {
  source                  = "./groups/registries-admin"
  HCIMWEB_HIAT1           = module.HCIMWEB_HIAT1
  HCIMWEB_HIAT2           = module.HCIMWEB_HIAT2
  HCIMWEB_HIAT3           = module.HCIMWEB_HIAT3
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "REGISTRIES-CONNECTIONS-TEAM" {
  source                  = "./groups/registries-connections-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "TBCM-MANAGEMENT" {
  source                  = "./groups/tbcm-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "TPL-MANAGEMENT" {
  source                  = "./groups/tpl-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "WEBCAPS-USER-ADMIN" {
  source                  = "./groups/webcaps-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}
