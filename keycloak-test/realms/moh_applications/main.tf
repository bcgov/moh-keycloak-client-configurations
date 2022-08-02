module "account" {
    source = "../../../modules/account"
}
module "realm-management" {
    source = "../../../modules/realm-management"
}
module "SFDS" {
    source = "./sfds"
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
module "MIWT" {
    source = "./miwt"
}
module "MIWT_STG" {
    source = "./miwt_stg"
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
module "USER-MANAGEMENT" {
    source = "./user-management"
    USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}
module "USER-MANAGEMENT-SERVICE" {
    source = "./user-management-service"
    realm-management= "${module.realm-management}"
    account= "${module.account}"
}
