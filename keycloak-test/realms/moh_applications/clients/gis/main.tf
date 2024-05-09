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

resource "keycloak_openid_user_attribute_protocol_mapper" "phsa_windowsaccountname" {
  add_to_id_token = false
  add_to_userinfo = false
  claim_name      = "preferred_username"
  client_id       = module.payara-client.CLIENT.id
  name            = "phsa_windowsaccountname"
  user_attribute  = "phsa_windowsaccountname"
  realm_id        = module.payara-client.CLIENT.realm_id
}
