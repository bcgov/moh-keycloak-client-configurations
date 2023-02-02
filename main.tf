module "KEYCLOAK_DEV" {
  source = "./keycloak-dev"

  client_id     = var.dev_client_id
  client_secret = var.dev_client_secret
  keycloak_url  = var.dev_keycloak_url
}

module "KEYCLOAK_TEST" {
  source = "./keycloak-test"

  client_id     = var.test_client_id
  client_secret = var.test_client_secret
  keycloak_url  = var.test_keycloak_url
}

module "KEYCLOAK_PROD" {
  source = "./keycloak-prod"

  client_id     = var.prod_client_id
  client_secret = var.prod_client_secret
  keycloak_url  = var.prod_keycloak_url
}