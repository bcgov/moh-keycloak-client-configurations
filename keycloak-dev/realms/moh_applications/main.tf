module "account" {
    source = "../../../modules/account"
}
module "realm-management" {
    source = "../../../modules/realm-management"
}
module "DMFT-SERVICE" {
    source = "./dmft-service"
}
module "DMFT-WEBAPP" {
    source = "./dmft-webapp"
}
module "EMCOD" {
    source = "./emcod"
}
module "SA-SFDC" {
    source = "./sa-sfdc"
}
module "EACL" {
    source = "./eacl"
}
module "FMDB" {
    source = "./fmdb"
}
module "GIS" {
    source = "./gis"
}
module "HCIMWEB" {
    source = "./hcimweb"
}
module "HCIMWEB_HD2" {
    source = "./hcimweb_hd2"
}
module "HSCIS" {
    source = "./hscis"
}
module "MIWT" {
    source = "./miwt"
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
module "SFDS" {
    source = "./sfds"
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
