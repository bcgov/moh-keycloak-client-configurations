module "account" {
    source = "../../../modules/account"
}
module "realm-management" {
    source = "../../../modules/realm-management"
}
module "BCER-CP" {
    source = "./bcer-cp"
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
    source = "./hamis"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "HOOPC" {
    source = "./hoopc"
}
module "HCIMWEB" {
    source = "./hcimweb"
}
module "HCIMWEB_HD2" {
    source = "./hcimweb_hd2"
}
module "HEM" {
    source = "./hem"
}
module "HSCIS" {
    source = "./hscis"
}
module "IEN" {
    source = "./ien"
}
module "LDAP-ACC-TRANS" {
    source = "./ldap-acc-trans"
    MSPDIRECT-SERVICE= "${module.MSPDIRECT-SERVICE}"
}
module "LDAP-ACC-TRANS-SERVICE" {
    source = "./ldap-acc-trans-service"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
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
    source = "./mspdirect-web"
    MSPDIRECT-SERVICE= "${module.MSPDIRECT-SERVICE}"
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
module "PLR" {
    source = "./plr"
    realm-management= "${module.realm-management}"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "PLR-SHOPPERS" {
    source = "./plr-shoppers"
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
