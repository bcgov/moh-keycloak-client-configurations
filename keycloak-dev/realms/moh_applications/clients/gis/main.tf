module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://gist.hlth.gov.bc.ca/gis"
  claim_name                         = "gis_role"
  client_id                          = "GIS"
  client_name                        = "GIS"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Guaranteed Income Supplement is used by Health Authorities to determine the rate of service fees to be charged to the client for certain Home Care services (Home Support or Residential Care)."
  mapper_name                        = "GIS Role"
  roles = {
    "GISUSER" = {
      "name" = "GISUSER"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "http://localhost:8080/*",
    "https://localhost:8081/*",
    "https://gisd.hlth.gov.bc.ca/*",
    "https://gist.hlth.gov.bc.ca/*",
    "https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
    "https://sts.healthbc.org/adfs/ls/*",
    "https://gis.ynr9ed-dev.nimbus.cloud.gov.bc.ca/gis/*",
    "https://gis.ynr9ed-test.nimbus.cloud.gov.bc.ca/gis/*",
  ]
}

resource "keycloak_generic_client_protocol_mapper" "phsa_windowsaccountname" {
  realm_id        = module.payara-client.CLIENT.realm_id
  client_id       = module.payara-client.CLIENT.id
  name            = "preferred_username"
  protocol        = "openid-connect"
  protocol_mapper = "oidc-override-usermodel-attribute-mapper"
  config = {
    "userinfo.token.claim" : "false",
    "user.attribute" : "phsa_windowsaccountname",
    "id.token.claim" : "true",
    "access.token.claim" : "true",
    "claim.name" : "preferred_username",
    "jsonType.label" : "String",
    "introspection.token.claim" = "false"
  }
}
