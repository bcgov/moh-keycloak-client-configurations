resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "ICY"
  consent_required                    = false
  description                         = "ICY teams goal is to address the mental health and/or substance use needs of children, youth, and their families."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Integrated Child and Youth"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcmohmaid.my.salesforce.com/*",
  ]
  web_origins = [
  ]
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "ICY-Central-Coast-Team-1-Clinical-Member" = {
      "name" = "ICY-Central-Coast-Team-1-Clinical-Member"
    },
    "ICY-Central-Coast-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Central-Coast-Team-1-Non-Clinical-Member"
    },
    "ICY-Central-Coast-Team-Admin" = {
      "name" = "ICY-Central-Coast-Team-Admin"
    },
    "ICY-Central-Coast-Team-Program-Leader" = {
      "name" = "ICY-Central-Coast-Team-Program-Leader"
    },
    "ICY-Cowichan-Valley-Team-1-Clinical-Member" = {
      "name" = "ICY-Cowichan-Valley-Team-1-Clinical-Member"
    },
    "ICY-Cowichan-Valley-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Cowichan-Valley-Team-1-Non-Clinical-Member"
    },
    "ICY-Cowichan-Valley-Team-Admin" = {
      "name" = "ICY-Cowichan-Valley-Team-Admin"
    },
    "ICY-Cowichan-Valley-Team-Program-Leader" = {
      "name" = "ICY-Cowichan-Valley-Team-Program-Leader"
    },
    "ICY-Delta-Team-1-Clinical-Member" = {
      "name" = "ICY-Delta-Team-1-Clinical-Member"
    },
    "ICY-Delta-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Delta-Team-1-Non-Clinical-Member"
    },
    "ICY-Delta-Team-Admin" = {
      "name" = "ICY-Delta-Team-Admin"
    },
    "ICY-Delta-Team-Program-Leader" = {
      "name" = "ICY-Delta-Team-Program-Leader"
    },
    "ICY-Gold-Trail-Team-1-Clinical-Member" = {
      "name" = "ICY-Gold-Trail-Team-1-Clinical-Member"
    },
    "ICY-Gold-Trail-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Gold-Trail-Team-1-Non-Clinical-Member"
    },
    "ICY-Gold-Trail-Team-Admin" = {
      "name" = "ICY-Gold-Trail-Team-Admin"
    },
    "ICY-Gold-Trail-Team-Program-Leader" = {
      "name" = "ICY-Gold-Trail-Team-Program-Leader"
    },
    "ICY-Nicola-Similkameen-Team-1-Clinical-Member" = {
      "name" = "ICY-Nicola-Similkameen-Team-1-Clinical-Member"
    },
    "ICY-Nicola-Similkameen-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Nicola-Similkameen-Team-1-Non-Clinical-Member"
    },
    "ICY-Nicola-Similkameen-Team-Admin" = {
      "name" = "ICY-Nicola-Similkameen-Team-Admin"
    },
    "ICY-Nicola-Similkameen-Team-Program-Leader" = {
      "name" = "ICY-Nicola-Similkameen-Team-Program-Leader"
    },
    "ICY-Peace-River-South-Team-1-Clinical-Member" = {
      "name" = "ICY-Peace-River-South-Team-1-Clinical-Member"
    },
    "ICY-Peace-River-South-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Peace-River-South-Team-1-Non-Clinical-Member"
    },
    "ICY-Peace-River-South-Team-Admin" = {
      "name" = "ICY-Peace-River-South-Team-Admin"
    },
    "ICY-Peace-River-South-Team-Program-Leader" = {
      "name" = "ICY-Peace-River-South-Team-Program-Leader"
    },
    "ICY-Qualicum-Team-1-Clinical-Member" = {
      "name" = "ICY-Qualicum-Team-1-Clinical-Member"
    },
    "ICY-Qualicum-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Qualicum-Team-1-Non-Clinical-Member"
    },
    "ICY-Qualicum-Team-Admin" = {
      "name" = "ICY-Qualicum-Team-Admin"
    },
    "ICY-Qualicum-Team-Program-Leader" = {
      "name" = "ICY-Qualicum-Team-Program-Leader"
    },
    "ICY-Surrey-Team-1-Clinical-Member" = {
      "name" = "ICY-Surrey-Team-1-Clinical-Member"
    },
    "ICY-Surrey-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Surrey-Team-1-Non-Clinical-Member"
    },
    "ICY-Surrey-Team-Admin" = {
      "name" = "ICY-Surrey-Team-Admin"
    },
    "ICY-Surrey-Team-Program-Leader" = {
      "name" = "ICY-Surrey-Team-Program-Leader"
    }
  }
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "ICY"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}
