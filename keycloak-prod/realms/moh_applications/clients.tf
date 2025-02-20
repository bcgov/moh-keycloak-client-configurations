module "account" {
  source = "../../../modules/account"
}
module "realm-management" {
  source = "../../../modules/realm-management"
}
module "ALR" {
  source = "./clients/alr"
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
module "CMDB" {
  source = "./clients/cmdb"
}
module "CONNECT" {
  source = "./clients/connect"
}
module "DHT-KEYCLOAK" {
  source         = "./clients/dht-keycloak"
  LICENCE-STATUS = module.LICENCE-STATUS

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
module "EDRD" {
  source = "./clients/edrd"
}
module "EDRD-PORTAL" {
  source         = "./clients/edrd-portal"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "EMACCS-UMS" {
  source                  = "./clients/emaccs-ums"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
module "EMCOD" {
  source = "./clients/emcod"
}
module "EHPR" {
  source = "./clients/ehpr"
}
module "FLORIZEL" {
  source = "./clients/florizel"
}
module "FMDB" {
  source = "./clients/fmdb"
}
module "FORMS" {
  source = "./clients/forms"
}
module "GENESYS" {
  source = "./clients/genesys"
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
module "HCIMWEB_HS1" {
  source = "./clients/hcimweb_hs1"
}
module "HCIM_ADE_STAGE" {
  source = "./clients/hcim_ade_stage"
}
module "HCIM_BCAS_STAGE" {
  source = "./clients/hcim_bcas_stage"
}
module "HCIM_BCAS_PCDES_STAGE" {
  source = "./clients/hcim_bcas_pcdes_stage"
}
module "HCIM_BCC_RX_STAGE" {
  source = "./clients/hcim_bcc_rx_stage"
}
module "HCIM_BCMI_STAGE" {
  source = "./clients/hcim_bcmi_stage"
}
module "HCIM_BCPSLS_STAGE" {
  source = "./clients/hcim_bcpsls_stage"
}
module "HCIM_BCPTN_STAGE" {
  source = "./clients/hcim_bcptn_stage"
}
module "HCIM_BCVAX_HC_STAGE" {
  source = "./clients/hcim_bcvax_hc_stage"
}
module "HCIM_CASC_STAGE" {
  source = "./clients/hcim_casc_stage"
}
module "HCIM_ELMS_STAGE" {
  source = "./clients/hcim_elms_stage"
}
module "HCIM_FHA_DFD" {
  source = "./clients/hcim_fha_dfd"
}
module "HCIM_FHA_STAGE" {
  source = "./clients/hcim_fha_stage"
}
module "HCIM_FHA_DFD_STAGE" {
  source = "./clients/hcim_fha_dfd_stage"
}
module "HCIM_HGWAY_STAGE" {
  source = "./clients/hcim_hgway_stage"
}
module "HCIM_HIAL_STAGE" {
  source = "./clients/hcim_hial_stage"
}
module "HCIM_HIBC_STAGE" {
  source = "./clients/hcim_hibc_stage"
}
module "HCIM_HIDEAS_STAGE" {
  source = "./clients/hcim_hideas_stage"
}
module "HCIM_HLNK_STAGE" {
  source = "./clients/hcim_hlnk_stage"
}
module "HCIM_HOOPC_STAGE" {
  source = "./clients/hcim_hoopc_stage"
}
module "HCIM_ICBC_STAGE" {
  source = "./clients/hcim_icbc_stage"
}
module "HCIM_IEHR_USER_STAGE" {
  source = "./clients/hcim_iehr_user_stage"
}
module "HCIM_IHA_STAGE" {
  source = "./clients/hcim_iha_stage"
}
module "HCIM_IMMS_SERVICEBC_STAGE" {
  source = "./clients/hcim_imms_servicebc_stage"
}
module "HCIM_LCTZ_STAGE" {
  source = "./clients/hcim_lctz_stage"
}
module "HCIM_LRA" {
  source = "./clients/hcim_lra"
}
module "HCIM_MELS_FAMS_STAGE" {
  source = "./clients/hcim_mels_fams_stage"
}
module "HCIM_MOF_STAGE" {
  source = "./clients/hcim_mof_stage"
}
module "HCIM_MOH_CRS" {
  source = "./clients/hcim_moh_crs"
}
module "HCIM_MOH_CRS_STAGE" {
  source = "./clients/hcim_moh_crs_stage"
}
module "HCIM_MOH_VSA_STAGE" {
  source = "./clients/hcim_moh_vsa_stage"
}
module "HCIM_MOJ_STAGE" {
  source = "./clients/hcim_moj_stage"
}
module "HCIM_MSPD_STAGE" {
  source = "./clients/hcim_mspd_stage"
}
module "HCIM_NHA_STAGE" {
  source = "./clients/hcim_nha_stage"
}
module "HCIM_OCABC_STAGE" {
  source = "./clients/hcim_ocabc_stage"
}
module "HCIM_PAS_STAGE" {
  source = "./clients/hcim_pas_stage"
}
module "HCIM_PHARM_STAGE" {
  source = "./clients/hcim_pharm_stage"
}
module "HCIM_PHARM_SA_STAGE" {
  source = "./clients/hcim_pharm_sa_stage"
}
module "HCIM_PHSA_STAGE" {
  source = "./clients/hcim_phsa_stage"
}
module "HCIM_PHSACSBC_STAGE" {
  source = "./clients/hcim_phsacsbc_stage"
}
module "HCIM_PHSA_EFORMS_STAGE" {
  source = "./clients/hcim_phsa_eforms_stage"
}
module "HCIM_PLIS_STAGE" {
  source = "./clients/hcim_plis_stage"
}
module "HCIM_PPHIS_STAGE" {
  source = "./clients/hcim_pphis_stage"
}
module "HCIM_PUBH_STAGE" {
  source = "./clients/hcim_pubh_stage"
}
module "HCIM_REACH_STAGE" {
  source = "./clients/hcim_reach_stage"
}
module "HCIM_SBCHCCS_STAGE" {
  source = "./clients/hcim_sbchccs_stage"
}
module "HCIM_SDM_STAGE" {
  source = "./clients/hcim_sdm_stage"
}
module "HCIM_SDPR_STAGE" {
  source = "./clients/hcim_sdpr_stage"
}
module "HCIM_VCHA_STAGE" {
  source = "./clients/hcim_vcha_stage"
}
module "HCIM_VIHA_STAGE" {
  source = "./clients/hcim_viha_stage"
}
module "HCIM_VIHAGH_STAGE" {
  source = "./clients/hcim_vihagh_stage"
}
module "HCIM_VPP_STAGE" {
  source = "./clients/hcim_vpp_stage"
}
module "HCIM_VSA_STAGE" {
  source = "./clients/hcim_vsa_stage"
}
module "HCIM_WARO_STAGE" {
  source = "./clients/hcim_waro_stage"
}
module "HDPBC" {
  source = "./clients/hdpbc"
}
module "HEALTH-IDEAS" {
  source = "./clients/health-ideas"
}
module "HEALTH-IDEAS-APEX" {
  source = "./clients/health-ideas-apex"
}
module "HEM" {
  source = "./clients/hem"
}
module "HHSLibrary" {
  source = "./clients/hhs-library"
}
module "HIDES" {
  source = "./clients/hides"
}
module "HLBC" {
  source = "./clients/hlbc"
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
  source         = "./clients/hsiar"
  LICENCE-STATUS = module.LICENCE-STATUS
}
module "HSPP" {
  source         = "./clients/hspp"
  LICENCE-STATUS = module.LICENCE-STATUS
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
module "METASPACE" {
  source = "./clients/metaspace"
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
module "PANORAMA" {
  source = "./clients/panorama"
}
module "PHLAT-SERVICE" {
  source = "./clients/phlat-service"
  PLR    = module.PLR
}
module "PHLAT-WEB" {
  source = "./clients/phlat-web"
}
module "PHO-RSC" {
  source         = "./clients/pho-rsc"
  PHO-RSC-GROUPS = module.PHO-RSC-GROUPS
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
  source       = "./clients/pidp-webapp"
  account      = module.account
  PIDP-SERVICE = module.PIDP-SERVICE
}
module "PLR" {
  source = "./clients/plr"
}
module "PLR-LRA" {
  source = "./clients/plr-lra"
  PLR    = module.PLR
}
module "PLR-PRP" {
  source = "./clients/plr-prp"
  PLR    = module.PLR
}
module "PLR-SHOPPERS" {
  source = "./clients/plr-shoppers"
  PLR    = module.PLR
}
module "PLR-REGADMIN" {
  source = "./clients/plr-regadmin"
  PLR    = module.PLR
}
module "PNET-API-CLIENT-GENERATION" {
  source           = "./clients/pnet-api-client-generation"
  realm-management = module.realm-management
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
module "USAM" {
  source = "./clients/usam"
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
