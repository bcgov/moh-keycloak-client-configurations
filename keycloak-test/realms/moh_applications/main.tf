module "account" {
    source = "./account"
}
module "realm-management" {
    source = "./realm-management"
}
module "FMDB" {
    source = "./fmdb"
}
module "MIWT" {
    source = "./miwt"
}
module "MIWT_STG" {
    source = "./miwt_stg"
}
module "PIDP-SERVICE" {
    source = "./pidp-service"
}
module "PIDP-WEBAPP" {
    source = "./pidp-webapp"
}
module "USER-MANAGEMENT-SERVICE" {
    source = "./user-management-service"
}
