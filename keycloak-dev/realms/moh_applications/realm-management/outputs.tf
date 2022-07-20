output "CLIENT" {
    value = data.keycloak_openid_client.CLIENT
}
output "ROLES" {
    value = module.client-roles-data-source.ROLES
}
