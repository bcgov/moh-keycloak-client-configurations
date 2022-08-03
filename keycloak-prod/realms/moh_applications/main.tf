module "account" {
    source = "../../../modules/account"
}
module "realm-management" {
    source = "../../../modules/realm-management"
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
module "HCIMWEB" {
    source = "./hcimweb"
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
