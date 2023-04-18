output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}
output "ROLES" {
  value = module.client-roles.ROLES
}
