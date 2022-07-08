resource "keycloak_openid_client" "UCI-SSO" {
  realm_id              = "moh_applications"
  client_id             = "UCI-SSO"
  name                  = "UCI-SSO"
  enabled               = true
  access_type           = "CONFIDENTIAL"
  standard_flow_enabled = true
  valid_redirect_uris   = [
    "http://localhost:8080/*",
    "https://localhost:8080/*"
  ]
}

resource "keycloak_role" "UCIROLE" {
  realm_id  = keycloak_openid_client.UCI-SSO.realm_id
  client_id = keycloak_openid_client.UCI-SSO.id
  name      = "UCIROLE"
}