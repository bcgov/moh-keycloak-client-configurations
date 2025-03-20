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
module "BULK-USER-UPLOAD" {
  source           = "./clients/bulk-user-upload"
  realm-management = module.realm-management
}
module "CONNECT" {
  source                       = "./clients/connect"
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
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
  source                       = "./clients/forms"
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
}
module "GIS" {
  source = "./clients/gis"
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
module "HDPBC" {
  source = "./clients/hdpbc"
}
module "HLBC" {
  source = "./clients/hlbc"
}
module "IEN" {
  source                       = "./clients/ien"
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
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
  source                       = "./clients/mspdirect-web"
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
  MSPDIRECT-SERVICE            = module.MSPDIRECT-SERVICE
}
module "ORGANIZATIONS-API" {
  source = "./clients/organizations-api"
}
module "PHLAT-SERVICE" {
  source = "./clients/phlat-service"
  PLR    = module.PLR
}
module "PHO-RSC" {
  source                       = "./clients/pho-rsc"
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
  PHO-RSC-GROUPS               = module.PHO-RSC-GROUPS
}
module "PHO-RSC-GROUPS" {
  source = "./clients/pho-rsc-groups"
}
module "PIDP-SERVICE" {
  source                  = "./clients/pidp-service"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "PIDP-SERVICE-ACCOUNT" {
  source = "./clients/pidp-service-account"
}
module "PIDP-WEBAPP" {
  source                       = "./clients/pidp-webapp"
  account                      = module.account
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
  PIDP-SERVICE                 = module.PIDP-SERVICE
}
module "PLR" {
  source                       = "./clients/plr"
  realm-management             = module.realm-management
  USER-MANAGEMENT-SERVICE      = module.USER-MANAGEMENT-SERVICE
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
}
module "PLR-SHOPPERS" {
  source = "./clients/plr-shoppers"
  PLR    = module.PLR
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
module "PRIME-VIHACERNER-ACCESS" {
  source                  = "./clients/prime-vihacerner-access"
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
module "SA-DBAAC-PORTAL" {
  source = "./clients/sa-dbaac-portal"
}
module "SA-HIBC-SERVICE-BC-PORTAL" {
  source = "./clients/sa-hibc-service-bc-portal"
}
module "SA-SFDC" {
  source = "./clients/sa-sfdc"
}
module "USER-MANAGEMENT-SERVICE" {
  source            = "./clients/user-management-service"
  realm-management  = module.realm-management
  account           = module.account
  ORGANIZATIONS-API = module.ORGANIZATIONS-API
  MSPDIRECT-SERVICE = module.MSPDIRECT-SERVICE
}
module "UMC-E2E-TESTS" {
  source = "./clients/umc-e2e-tests"
}
module "UMS-INTEGRATION-TESTS" {
  source                  = "./clients/ums-integration-tests"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
  ORGANIZATIONS-API       = module.ORGANIZATIONS-API
}
module "USER-MANAGEMENT" {
  source                       = "./clients/user-management"
  USER-MANAGEMENT-SERVICE      = module.USER-MANAGEMENT-SERVICE
  browser_idp_restriction_flow = local.browser_idp_restriction_flow
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
locals {
  # ID of the browser-idp-restriction authentication flow in moh_applications DEV.
  # Used by selected clients, overrides the default browser flow.
  browser_idp_restriction_flow = "9caca0f9-1c0c-4def-85c6-637d1c8a4d24"
}
