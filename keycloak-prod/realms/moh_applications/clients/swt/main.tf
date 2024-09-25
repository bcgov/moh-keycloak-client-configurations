module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = "https://swtadmin.hlth.gov.bc.ca/swt/admin"
  claim_name                         = "swt_role"
  client_id                          = "SWT"
  client_name                        = "SWT"
  client_role_mapper_add_to_id_token = false
  client_role_mapper_add_to_userinfo = false
  description                        = "The Surgical Wait Times application allows the general public to view the wait list for each type of elective surgery in the province."
  mapper_name                        = "SWT Role"
  roles = {
    "Administrator" = {
      "name" = "Administrator"
    },
    "Analyst" = {
      "name" = "Analyst"
    },
    "Reviewer" = {
      "name" = "Reviewer"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://swtadmin.hlth.gov.bc.ca/*",
    "https://logon7.gov.bc.ca/clp-cgi/logoff.cgi*",
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
    "jsonType.label" : "String"
  }
}
