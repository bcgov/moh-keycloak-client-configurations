module "account" {
  source = "../../../modules/account"
}
module "realm-management" {
  source = "../../../modules/realm-management"
}
module "BCER-CP" {
  source = "./bcer-cp"
}
module "CONNECT" {
  source = "./connect"
}
module "DMFT-SERVICE" {
  source = "./dmft-service"
}
module "DMFT-WEBAPP" {
  source = "./dmft-webapp"
}
module "EACL" {
  source = "./eacl"
}
module "EMCOD" {
  source = "./emcod"
}
module "FMDB" {
  source = "./fmdb"
}
module "GIS" {
  source = "./gis"
}
module "HAMIS" {
  source                  = "./hamis"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "HCIMWEB" {
  source = "./hcimweb"
}
module "HCIMWEB_HD2" {
  source = "./hcimweb_hd2"
}
module "HCIM-SERVICE" {
  source = "./hcim-service"
}
module "HEM" {
  source = "./hem"
}
module "HOOPC" {
  source = "./hoopc"
}
module "HSCIS" {
  source = "./hscis"
}
module "IEN" {
  source = "./ien"
}
module "LDAP-ACC-TRANS" {
  source            = "./ldap-acc-trans"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "LDAP-ACC-TRANS-SERVICE" {
  source                  = "./ldap-acc-trans-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "LDAP-API" {
  source            = "./ldap-api"
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
}
module "MAID" {
  source = "./maid"
}
module "MIWT" {
  source = "./miwt"
}
module "MOH-SERVICENOW" {
  source = "./moh-servicenow"
}
module "MSPDIRECT-SERVICE" {
  source = "./mspdirect-service"
}
module "MSPDIRECT-WEB" {
  source            = "./mspdirect-web"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "ORGANIZATIONS-API" {
  source = "./organizations-api"
}
module "PHO-RSC" {
  source = "./pho-rsc"
}
module "PIDP-SERVICE" {
  source                  = "./pidp-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-WEBAPP" {
  source       = "./pidp-webapp"
  account      = module.account
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "PLR" {
  source                  = "./plr"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR-PRP" {
  source = "./plr-prp"
}
module "PLR-SHOPPERS" {
  source = "./plr-shoppers"
}
module "PRIME-WEBAPP-ENROLLMENT" {
  source  = "./prime-webapp-enrollment"
  account = module.account
}
module "PRIME-WEBAPP-ENROLLMENT-SERVICE" {
  source                  = "./prime-webapp-enrollment-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PRP-SERVICE" {
  source = "./prp-service"
}
module "PRP-WEB" {
  source      = "./prp-web"
  PRP-SERVICE = module.PRP-SERVICE
}
module "SAT-EFORMS" {
  source = "./sat-eforms"
}
module "SA-DBAAC-PORTAL" {
  source = "./sa-dbaac-portal"
}
module "SA-HIBC-SERVICE-BC-PORTAL" {
  source = "./sa-hibc-service-bc-portal"
}
module "SA-SFDC" {
  source = "./sa-sfdc"
}
module "SFDS" {
  source = "./sfds"
}
module "SWT" {
  source = "./swt"
}
module "UCI-SSO" {
  source = "./uci-sso"
}
module "USER-MANAGEMENT-SERVICE" {
  source            = "./user-management-service"
  realm-management  = module.realm-management
  account           = module.account
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
}
module "USER-MANAGEMENT" {
  source                  = "./user-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "WEBCAPS" {
  source = "./webcaps"
}
