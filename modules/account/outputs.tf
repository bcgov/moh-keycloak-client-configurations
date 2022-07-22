output "CLIENT" {
  value = data.keycloak_openid_client.CLIENT
}
output "ROLES" {
  value = data.keycloak_role.ROLES
}