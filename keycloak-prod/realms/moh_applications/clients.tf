module "account" {
  source = "../../../modules/account"
}
module "realm-management" {
  source = "../../../modules/realm-management"
}
module "BCER-CP" {
  source = "./clients/bcer-cp"
}
module "BCHCIM" {
  source = "./clients/bchcim"
}
module "CONNECT" {
  source = "./clients/connect"
}
module "DMFT-SERVICE" {
  source       = "./clients/dmft-service"
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "DMFT-WEBAPP" {
  source         = "./clients/dmft-webapp"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "EACL" {
  source = "./clients/eacl"
}
module "EMCOD" {
  source = "./clients/emcod"
}
module "EHPR" {
  source = "./clients/ehpr"
}
module "FMDB" {
  source = "./clients/fmdb"
}
module "FORMS" {
  source = "./clients/forms"
}
module "GIS" {
  source = "./clients/gis"
}
module "HAMIS" {
  source                  = "./clients/hamis"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "HCAP-FE" {
  source = "./clients/hcap-fe"
}
module "HCAP-SERVICE" {
  source                  = "./clients/hcap-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "HCIMWEB" {
  source = "./clients/hcimweb"
}
module "HDPBC" {
  source = "./clients/hdpbc"
}
module "HEM" {
  source = "./clients/hem"
}
module "HHSLibrary" {
  source = "./clients/hhs-library"
}
module "hnsesb_api_gateway_client_manager" {
  source           = "./clients/hnsesb_api_gateway_client_manager"
  realm-management = module.realm-management
  account          = module.account
}
module "HOOPC" {
  source = "./clients/hoopc"
}
module "HSCIS" {
  source = "./clients/hscis"
}
module "HSIAR" {
  source = "./clients/hsiar"
}
module "HSPP" {
  source = "./clients/hspp"
}
module "ICY" {
  source = "./clients/icy"
}
module "IEN" {
  source = "./clients/ien"
}
module "LDAP-ACC-TRANS" {
  source = "./clients/ldap-acc-trans"
}
module "LDAP-ACC-TRANS-SERVICE" {
  source                  = "./clients/ldap-acc-trans-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "LDAP-API" {
  source            = "./clients/ldap-api"
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
}
module "LICENCE-STATUS" {
  source = "./clients/licence-status"
}
module "MAID" {
  source = "./clients/maid"
}
module "MIWT" {
  source = "./clients/miwt"
}
module "MOH-SERVICENOW" {
  source = "./clients/moh-servicenow"
}
module "MOH-SPLUNK" {
  source = "./clients/moh-splunk"
}
module "MSPDIRECT-SERVICE" {
  source = "./clients/mspdirect-service"
}
module "MSPDIRECT-WEB" {
  source            = "./clients/mspdirect-web"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "ORGANIZATIONS-API" {
  source = "./clients/organizations-api"
}
module "PHO-RSC" {
  source = "./clients/pho-rsc"
}
module "PIDP-SERVICE" {
  source                  = "./clients/pidp-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-SERVICE-ACCOUNT" {
  source = "./clients/pidp-service-account"
}
module "PIDP-WEBAPP" {
  source       = "./clients/pidp-webapp"
  account      = module.account
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "PLR" {
  source = "./clients/plr"
}
module "PLR-SHOPPERS" {
  source = "./clients/plr-shoppers"
  PLR    = module.PLR
}
module "PPM-API-CGI-BC30550160" {
  source = "./clients/ppm-api-cgi-BC30550160"
}
module "PRIMARY-CARE" {
  source         = "./clients/primary-care"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "PRIME-APPLICATION" {
  source  = "./clients/prime-application"
  account = module.account
}
module "PRIME-APPLICATION-SERVICE-ACCOUNT" {
  source            = "./clients/prime-application-service-account"
  PRIME-APPLICATION = module.PRIME-APPLICATION
}
module "PRIME-CARECONNECT-ACCESS" {
  source            = "./clients/prime-careconnect-access"
  PRIME-APPLICATION = module.PRIME-APPLICATION
}
module "PRIME-DOCUMENT-MANAGER" {
  source = "./clients/prime-document-manager"
}
module "PRIME-MEDINET-ACCESS" {
  source            = "./clients/prime-medinet-access"
  PRIME-APPLICATION = module.PRIME-APPLICATION
}
module "PRIME-WEBAPP-ENROLLMENT" {
  source  = "./clients/prime-webapp-enrollment"
  account = module.account
}
module "PRIME-WEBAPP-ENROLLMENT-SERVICE" {
  source                  = "./clients/prime-webapp-enrollment-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PRP-SERVICE" {
  source = "./clients/prp-service"
}
module "PRP-WEB" {
  source         = "./clients/prp-web"
  PRP-SERVICE    = module.PRP-SERVICE
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "SAT-EFORMS" {
  source = "./clients/sat-eforms"
}
module "SA-DBAAC-PORTAL" {
  source = "./clients/sa-dbaac-portal"
}
module "SA-HIBC-SERVICE-BC-PORTAL" {
  source = "./clients/sa-hibc-service-bc-portal"
}
module "SA-SFDC" {
  source = "./clients/sa-sfdc"
}
module "SFDS" {
  source = "./clients/sfds"
}
module "SWT" {
  source = "./clients/swt"
}
module "TAP" {
  source = "./clients/tap"
}
module "TBCM" {
  source = "./clients/tbcm"
}
module "terraform" {
  source           = "./clients/terraform"
  realm-management = module.realm-management
}
module "TPL" {
  source = "./clients/tpl"
}
module "USER-MANAGEMENT-SERVICE" {
  source            = "./clients/user-management-service"
  realm-management  = module.realm-management
  account           = module.account
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "USER-MANAGEMENT" {
  source                  = "./clients/user-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "WEBCAPS" {
  source = "./clients/webcaps"
}
