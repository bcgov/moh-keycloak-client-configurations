module "account" {
    source = "../../../modules/account"
}
module "realm-management" {
    source = "../../../modules/realm-management"
}
module "BCER-CP" {
    source = "./bcer-cp"
}
module "EACL" {
    source = "./eacl"
}
module "EMCOD" {
    source = "./emcod"
}
module "HAMIS" {
    source = "./hamis"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "HOOPC" {
    source = "./hoopc"
}
module "FMDB" {
    source = "./fmdb"
}
module "GIS" {
    source = "./gis"
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
module "HSCIS" {
    source = "./hscis"
}
module "IEN" {
    source = "./ien"
}
module "LDAP-ACC-TRANS" {
    source = "./ldap-acc-trans"
}
module "LDAP-ACC-TRANS-SERVICE" {
    source = "./ldap-acc-trans-service"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
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
module "PIDP-SERVICE" {
    source = "./pidp-service"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "PIDP-WEBAPP" {
    source = "./pidp-webapp"
    account= "${module.account}"
    PIDP-SERVICE= "${module.PIDP-SERVICE}"
}
module "PRIME-WEBAPP-ENROLLMENT" {
    source = "./prime-webapp-enrollment"
    account= "${module.account}"
}
module "PRIME-WEBAPP-ENROLLMENT-SERVICE" {
    source = "./prime-webapp-enrollment-service"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "SAT-EFORMS" {
    source = "./sat-eforms"
}
module "SA-DBAAC-PORTAL" {
    source = "./sa-dbaac-portal"
}
module "SA-SFDC" {
    source = "./sa-sfdc"
}
module "SFDS" {
    source = "./sfds"
}
module "USER-MANAGEMENT" {
    source = "./user-management"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "USER-MANAGEMENT-SERVICE" {
    source = "./user-management-service"
    realm-management= "${module.realm-management}"
    account= "${module.account}"
}
module "WEBCAPS" {
    source = "./webcaps"
}
