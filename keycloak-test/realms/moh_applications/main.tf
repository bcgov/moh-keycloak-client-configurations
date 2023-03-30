module "account" {
  source = "../../../modules/account"
}
module "realm-management" {
  source = "../../../modules/realm-management"
}
module "BCER-CP" {
  source = "./bcer-cp"
}
module "BCHCIM" {
  source = "./bchcim"
}
module "CONNECT" {
  source = "./connect"
}
module "DEMO-CLIENT" {
  source = "./demo-client"
}
module "DMFT-SERVICE" {
  source       = "./dmft-service"
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "DMFT-WEBAPP" {
  source         = "./dmft-webapp"
  LICENCE-STATUS = module.LICENCE-STATUS
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
module "HCAP-FE" {
  source = "./hcap-fe"
}
module "HCAP-SERVICE" {
  source                  = "./hcap-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "HCIMWEB_HIAT1" {
  source = "./hcimweb_hiat1"
}
module "HCIMWEB_HIAT2" {
  source = "./hcimweb_hiat2"
}
module "HCIMWEB_HIAT3" {
  source = "./hcimweb_hiat3"
}
module "HCIMWEB_HS1" {
  source = "./hcimweb_hs1"
}
module "HCIMWEB_HSIT" {
  source = "./hcimweb_hsit"
}
module "HCIMWEB_HUAT" {
  source = "./hcimweb_huat"
}
module "HDPBC" {
  source = "./hdpbc"
}
module "HEM" {
  source = "./hem"
}
module "HHSLibrary" {
  source = "./hhs-library"
}
module "hnsesb_api_gateway_client_manager" {
  source           = "./hnsesb_api_gateway_client_manager"
  realm-management = module.realm-management
  account          = module.account
}
module "HOOPC" {
  source = "./hoopc"
}
module "HOOPC_STG" {
  source = "./hoopc_stg"
}
module "HSCIS" {
  source = "./hscis"
}
module "HSIAR" {
  source = "./hsiar"
}
module "IEN" {
  source = "./ien"
}
module "LDAP-ACC-TRANS" {
  source = "./ldap-acc-trans"
}
module "LDAP-ACC-TRANS-SERVICE" {
  source                  = "./ldap-acc-trans-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "LDAP-API" {
  source            = "./ldap-api"
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
}
module "LICENCE-STATUS" {
  source = "./licence-status"
}
module "MAID" {
  source = "./maid"
}
module "MIWT" {
  source = "./miwt"
}
module "MIWT_STG" {
  source = "./miwt_stg"
}
module "MOH-SERVICENOW" {
  source = "./moh-servicenow"
}
module "MSPDIRECT-SERVICE" {
  source = "./mspdirect-service"
}
module "MSPDIRECT-SERVICE-UAT" {
  source = "./mspdirect-service-uat"
}
module "MSPDIRECT-WEB" {
  source            = "./mspdirect-web"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "MSPDIRECT-WEB-UAT" {
  source                = "./mspdirect-web-uat"
  MSPDIRECT-SERVICE-UAT = module.MSPDIRECT-SERVICE-UAT
}
module "ORGANIZATIONS-API" {
  source = "./organizations-api"
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
module "PLR-PRP" {
  source = "./plr-prp"
}
module "PLR-QA-CONSUMER" {
  source   = "./plr-qa-consumer"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-DSR-USER" {
  source   = "./plr-qa-dsr-user"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-MOH-APPROVER" {
  source   = "./plr-qa-moh-approver"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-PRIMARY-SOURCE" {
  source   = "./plr-qa-primary-source"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-REGADMIN" {
  source   = "./plr-qa-regadmin"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-SECONDARY-SOURCE" {
  source   = "./plr-qa-secondary-source"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-SHOPPERS" {
  source   = "./plr-shoppers"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
  PLR_FLVR = module.PLR_FLVR
  PLR_STG  = module.PLR_STG
}
module "PLR-MOH" {
  source = "./plr-moh"
}
module "PLR_CONF" {
  source                  = "./plr_conf"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_FLVR" {
  source                  = "./plr_flvr"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_IAT" {
  source                  = "./plr_iat"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_REV" {
  source                  = "./plr_rev"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_SIT" {
  source                  = "./plr_sit"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_STG" {
  source                  = "./plr_stg"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_UAT" {
  source                  = "./plr_uat"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PRIMARY-CARE" {
  source = "./primary-care"
}
module "PRIME-DOCUMENT-MANAGER" {
  source = "./prime-document-manager"
}
module "PRIME-APPLICATION-DEV" {
  source = "./prime-application-dev"
}
module "PRIME-APPLICATION-LOCAL" {
  source = "./prime-application-local"
}
module "PRIME-APPLICATION-SERVICE-ACCOUNT" {
  source = "./prime-application-service-account"
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
module "SAT-EFORMS_QA" {
  source = "./sat-eforms_qa"
}
module "SFDS" {
  source = "./sfds"
}
module "SWT" {
  source = "./swt"
}
module "SWT_STG" {
  source = "./swt_stg"
}
module "TAP" {
  source = "./tap"
}
module "terraform" {
  source           = "./terraform"
  realm-management = module.realm-management
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
