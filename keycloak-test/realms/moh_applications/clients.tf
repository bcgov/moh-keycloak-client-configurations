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
module "DEMO-CLIENT" {
  source = "./clients/demo-client"
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
module "EACL_STG" {
  source = "./clients/eacl_stg"
}
module "EMCOD" {
  source = "./clients/emcod"
}
module "FMDB" {
  source = "./clients/fmdb"
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
module "HCIMWEB_HIAT1" {
  source = "./clients/hcimweb_hiat1"
}
module "HCIMWEB_HIAT2" {
  source = "./clients/hcimweb_hiat2"
}
module "HCIMWEB_HIAT3" {
  source = "./clients/hcimweb_hiat3"
}
module "HCIMWEB_HS1" {
  source = "./clients/hcimweb_hs1"
}
module "HCIMWEB_HSIT" {
  source = "./clients/hcimweb_hsit"
}
module "HCIMWEB_HUAT" {
  source = "./clients/hcimweb_huat"
}
module "HCIM_VIHA" {
  source = "./clients/hcim_viha"
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
module "HOOPC_STG" {
  source = "./clients/hoopc_stg"
}
module "HSCIS" {
  source = "./clients/hscis"
}
module "HSIAR" {
  source = "./clients/hsiar"
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
module "MIWT_STG" {
  source = "./clients/miwt_stg"
}
module "MOH-SERVICENOW" {
  source = "./clients/moh-servicenow"
}
module "MSPDIRECT-SERVICE" {
  source = "./clients/mspdirect-service"
}
module "MSPDIRECT-SERVICE-UAT" {
  source = "./clients/mspdirect-service-uat"
}
module "MSPDIRECT-WEB" {
  source            = "./clients/mspdirect-web"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "MSPDIRECT-WEB-UAT" {
  source                = "./clients/mspdirect-web-uat"
  MSPDIRECT-SERVICE-UAT = module.MSPDIRECT-SERVICE-UAT
}
module "ORGANIZATIONS-API" {
  source = "./clients/organizations-api"
}
module "PIDP-SERVICE" {
  source                  = "./clients/pidp-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-WEBAPP" {
  source       = "./clients/pidp-webapp"
  account      = module.account
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "PLR-PRIMARY-CARE" {
  source   = "./clients/plr-primary-care"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
  PLR_FLVR = module.PLR_FLVR
  PLR_STG  = module.PLR_STG
}
module "PLR-PRP" {
  source = "./clients/plr-prp"
}
module "PLR-QA-CONSUMER" {
  source   = "./clients/plr-qa-consumer"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-DSR-USER" {
  source   = "./clients/plr-qa-dsr-user"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-MOH-APPROVER" {
  source   = "./clients/plr-qa-moh-approver"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-PRIMARY-SOURCE" {
  source   = "./clients/plr-qa-primary-source"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-REGADMIN" {
  source   = "./clients/plr-qa-regadmin"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-QA-SECONDARY-SOURCE" {
  source   = "./clients/plr-qa-secondary-source"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
}
module "PLR-SHOPPERS" {
  source   = "./clients/plr-shoppers"
  PLR_IAT  = module.PLR_IAT
  PLR_UAT  = module.PLR_UAT
  PLR_SIT  = module.PLR_SIT
  PLR_CONF = module.PLR_CONF
  PLR_REV  = module.PLR_REV
  PLR_FLVR = module.PLR_FLVR
  PLR_STG  = module.PLR_STG
}
module "PLR-MOH" {
  source = "./clients/plr-moh"
}
module "PLR_CONF" {
  source                  = "./clients/plr_conf"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_FLVR" {
  source                  = "./clients/plr_flvr"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_IAT" {
  source                  = "./clients/plr_iat"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_REV" {
  source                  = "./clients/plr_rev"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_SIT" {
  source                  = "./clients/plr_sit"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_STG" {
  source                  = "./clients/plr_stg"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR_UAT" {
  source                  = "./clients/plr_uat"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PRIMARY-CARE" {
  source         = "./clients/primary-care"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "PRIME-DOCUMENT-MANAGER" {
  source = "./clients/prime-document-manager"
}
module "PRIME-APPLICATION-DEV" {
  source = "./clients/prime-application-dev"
}
module "PRIME-APPLICATION-LOCAL" {
  source  = "./clients/prime-application-local"
  account = module.account
}
module "PRIME-APPLICATION-TEST" {
  source  = "./clients/prime-application-test"
  account = module.account
}
module "PRIME-APPLICATION-SERVICE-ACCOUNT" {
  source                  = "./clients/prime-application-service-account"
  PRIME-APPLICATION-LOCAL = module.PRIME-APPLICATION-LOCAL
  PRIME-APPLICATION-TEST  = module.PRIME-APPLICATION-TEST
}
module "PRIME-MEDINET-ACCESS" {
  source                  = "./clients/prime-medinet-access"
  PRIME-APPLICATION-LOCAL = module.PRIME-APPLICATION-LOCAL
  PRIME-APPLICATION-TEST  = module.PRIME-APPLICATION-TEST
}
module "PRIME-CARECONNECT-ACCESS" {
  source                  = "./clients/prime-careconnect-access"
  PRIME-APPLICATION-LOCAL = module.PRIME-APPLICATION-LOCAL
  PRIME-APPLICATION-TEST  = module.PRIME-APPLICATION-TEST
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
  source      = "./clients/prp-web"
  PRP-SERVICE = module.PRP-SERVICE
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
module "SAT-EFORMS_QA" {
  source = "./clients/sat-eforms_qa"
}
module "SFDS" {
  source = "./clients/sfds"
}
module "SWT" {
  source = "./clients/swt"
}
module "SWT_STG" {
  source = "./clients/swt_stg"
}
module "TAP" {
  source = "./clients/tap"
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
module "HCIM_BCMI" {
  source = "./clients/hcim_bcmi"
}
module "HCIM_FHA" {
  source = "./clients/hcim_fha"
}
module "HCIM_HIBC" {
  source = "./clients/hcim_hibc"
}
module "HCIM_IHA" {
  source = "./clients/hcim_iha"
}
module "HCIM_LCTZ" {
  source = "./clients/hcim_lctz"
}
module "HCIM_MOH_CRS" {
  source = "./clients/hcim_moh_crs"
}
module "HCIM_MOH_VSA" {
  source = "./clients/hcim_moh_vsa"
}
module "HCIM_NHA" {
  source = "./clients/hcim_nha"
}
module "HCIM_PHARM" {
  source = "./clients/hcim_pharm"
}
module "HCIM_PHSA" {
  source = "./clients/hcim_phsa"
}
module "HCIM_PUBH" {
  source = "./clients/hcim_pubh"
}
module "HCIM_SDPR" {
  source = "./clients/hcim_sdpr"
}
module "HCIM_VCHA" {
  source = "./clients/hcim_vcha"
}
module "HCIM_VPP" {
  source = "./clients/hcim_vpp"
}