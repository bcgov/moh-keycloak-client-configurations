module "MIWT" {
  source = "./miwt"
}

module "FMDB" {
  source = "./fmdb"
}

module "PIDP-WEBAPP" {
	source = "./pidp-webapp"
	PIDP-SERVICE= "${module.PIDP-SERVICE}"
}

module "PIDP-SERVICE" {
	source = "./pidp-service"
	USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}


module "USER-MANAGEMENT-SERVICE" {
  source = "./user-management-service"
  realm-management = "${module.realm-management}"
}

module "USER-MANAGEMENT" {
	source = "./user-management"
  USER-MANAGEMENT-SERVICE= "${module.USER-MANAGEMENT-SERVICE}"
}

module "realm-management" {
  source = "./realm-management"
}