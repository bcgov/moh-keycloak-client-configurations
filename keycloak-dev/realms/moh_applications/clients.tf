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
module "EMCOD" {
  source = "./clients/emcod"
}
module "FORMS" {
  source = "./clients/forms"
}
module "HCIMWEB" {
  source = "./clients/hcimweb"
}
module "HCIMWEB_HD2" {
  source = "./clients/hcimweb_hd2"
}
module "HCIM-SERVICE" {
  source = "./clients/hcim-service"
}
module "HEM" {
  source = "./clients/hem"
}
module "HLBC" {
  source = "./clients/hlbc"
}
module "IEN" {
  source = "./clients/ien"
}
module "LDAP-ACC-TRANS" {
  source            = "./clients/ldap-acc-trans"
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
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
module "METASPACE" {
  source = "./clients/metaspace"
}
module "MOH-SERVICENOW" {
  source = "./clients/moh-servicenow"
}
module "MOH_SPLUNK_COPY" {
  source = "./clients/moh-splunk-copy"
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
  source                  = "./clients/plr"
  realm-management        = module.realm-management
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PLR-SHOPPERS" {
  source = "./clients/plr-shoppers"
  PLR    = module.PLR
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
module "SA-DBAAC-PORTAL" {
  source = "./clients/sa-dbaac-portal"
}
module "SA-HIBC-SERVICE-BC-PORTAL" {
  source = "./clients/sa-hibc-service-bc-portal"
}
module "SA-SFDC" {
  source = "./clients/sa-sfdc"
}
module "terraform" {
  source           = "./clients/terraform"
  realm-management = module.realm-management
}
module "USER-MANAGEMENT-SERVICE" {
  source            = "./clients/user-management-service"
  realm-management  = module.realm-management
  account           = module.account
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "UMS-INTEGRATION-TESTS" {
  source                  = "./clients/ums-integration-tests"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
  ORGANIZATIONS-API       = module.ORGANIZATIONS-API
}
module "USER-MANAGEMENT" {
  source                  = "./clients/user-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
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
module "HCIM_LRA" {
  source = "./clients/hcim_lra"
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
module "HCIM_VIHA" {
  source = "./clients/hcim_viha"
}
module "HCIM_VPP" {
  source = "./clients/hcim_vpp"
}
