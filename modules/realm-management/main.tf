data "keycloak_openid_client" "CLIENT" {
    realm_id = "moh_applications"
    client_id = "realm-management"
}

data "keycloak_role" "ROLES" {
  realm_id = data.keycloak_openid_client.CLIENT.realm_id
  client_id = data.keycloak_openid_client.CLIENT.id
  for_each    = var.roles
  name        = each.value
}

