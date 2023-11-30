resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "ICY"
  consent_required                    = false
  description                         = "ICY teams bring together community agencies, school support resources, and clinicians to work in an integrated and collaborative manner to address the mental health and/or substance use needs of children, youth, and their families - where and when they need it."
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
    "https://bcmohmaid--maiduat.my.salesforce.com/*",
    "https://bcmohmaid--maidqa.my.salesforce.com/*",
    "https://bcmohmaid--maiduat.sandbox.my.salesforce.com/*",
    "https://bcmohmaid--maidqa.sandbox.my.salesforce.com/*"
  ]
  web_origins = [
  ]
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "ICY-Business-Administrator" = {
      "name" = "ICY-Business-Administrator"
    },
    "ICY-Coast-Mountains-Team-Hazelton-Program-Leader" = {
      "name" = "ICY-Coast-Mountains-Team-Hazelton-Program-Leader"
    },
    "ICY-Coast-Mountains-Team-Hazelton-Admin" = {
      "name" = "ICY-Coast-Mountains-Team-Hazelton-Admin"
    },
    "ICY-Coast-Mountains-Team-Hazelton-Non-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Team-Hazelton-Non-Clinical-Team-Member"
    },
    "ICY-Coast-Mountains-Team-Hazelton-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Team-Hazelton-Team-Member"
    },
    "ICY-Coast-Mountains-Team-Terrace-Program-Leader" = {
      "name" = "ICY-Coast-Mountains-Team-Terrace-Program-Leader"
    },
    "ICY-Coast-Mountains-Team-Terrace-Admin" = {
      "name" = "ICY-Coast-Mountains-Team-Terrace-Admin"
    },
    "ICY-Coast-Mountains-Team-Terrace-Non-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Team-Terrace-Non-Clinical-Team-Member"
    },
    "ICY-Coast-Mountains-Team-Terrace-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Team-Terrace-Team-Member"
    },
    "ICY-Comox-Valley-Team-1-Program-Leader" = {
      "name" = "ICY-Comox-Valley-Team-1-Program-Leader"
    },
    "ICY-Comox-Valley-Team-1-Admin" = {
      "name" = "ICY-Comox-Valley-Team-1-Admin"
    },
    "ICY-Comox-Valley-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-1-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-1-Team-Member"
    },
    "ICY-Comox-Valley-Team-2-Program-Leader" = {
      "name" = "ICY-Comox-Valley-Team-2-Program-Leader"
    },
    "ICY-Comox-Valley-Team-2-Admin" = {
      "name" = "ICY-Comox-Valley-Team-2-Admin"
    },
    "ICY-Comox-Valley-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-2-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-2-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Team-Member"
    },
    "ICY-Okanagan-Similkameen-Program-Leader" = {
      "name" = "ICY-Okanagan-Similkameen-Program-Leader"
    },
    "ICY-Okanagan-Similkameen-Admin" = {
      "name" = "ICY-Okanagan-Similkameen-Admin"
    },
    "ICY-Okanagan-Similkameen-Non-Clinical-Team-Member" = {
      "name" = "ICY-Okanagan-Similkameen-Non-Clinical-Team-Member"
    },
    "ICY-Okanagan-Similkameen-Team-Member" = {
      "name" = "ICY-Okanagan-Similkameen-Team-Member"
    },
    "ICY-Richmond-Team-1-Program-Leader" = {
      "name" = "ICY-Richmond-Team-1-Program-Leader"
    },
    "ICY-Richmond-Team-1-Admin" = {
      "name" = "ICY-Richmond-Team-1-Admin"
    },
    "ICY-Richmond-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-1-Team-Member" = {
      "name" = "ICY-Richmond-Team-1-Team-Member"
    },
    "ICY-Richmond-Team-2-Program-Leader" = {
      "name" = "ICY-Richmond-Team-2-Program-Leader"
    },
    "ICY-Richmond-Team-2-Admin" = {
      "name" = "ICY-Richmond-Team-2-Admin"
    },
    "ICY-Richmond-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-2-Team-Member" = {
      "name" = "ICY-Richmond-Team-2-Team-Member"
    },
    "ICY-Richmond-Team-3-Program-Leader" = {
      "name" = "ICY-Richmond-Team-3-Program-Leader"
    },
    "ICY-Richmond-Team-3-Admin" = {
      "name" = "ICY-Richmond-Team-3-Admin"
    },
    "ICY-Richmond-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-3-Team-Member" = {
      "name" = "ICY-Richmond-Team-3-Team-Member"
    },
    "ICY-Richmond-Team-4-Program-Leader" = {
      "name" = "ICY-Richmond-Team-4-Program-Leader"
    },
    "ICY-Richmond-Team-4-Admin" = {
      "name" = "ICY-Richmond-Team-4-Admin"
    },
    "ICY-Richmond-Team-4-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-4-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-4-Team-Member" = {
      "name" = "ICY-Richmond-Team-4-Team-Member"
    },
    "ICY-Fraser-Cascades-Team-1-Program-Leader" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Program-Leader"
    },
    "ICY-Fraser-Cascades-Team-1-Admin" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Admin"
    },
    "ICY-Fraser-Cascades-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Fraser-Cascades-Team-1-Team-Member" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Team-Member"
    },
    "ICY-Kootenay-Columbia-Team-1-Program-Leader" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Program-Leader"
    },
    "ICY-Kootenay-Columbia-Team-1-Admin" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Admin"
    },
    "ICY-Kootenay-Columbia-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Kootenay-Columbia-Team-1-Team-Member" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Team-Member"
    },
    "ICY-Mission-Team-1-Program-Leader" = {
      "name" = "ICY-Mission-Team-1-Program-Leader"
    },
    "ICY-Mission-Team-1-Admin" = {
      "name" = "ICY-Mission-Team-1-Admin"
    },
    "ICY-Mission-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Mission-Team-1-Team-Member" = {
      "name" = "ICY-Mission-Team-1-Team-Member"
    },
    "ICY-Mission-Team-2-Program-Leader" = {
      "name" = "ICY-Mission-Team-2-Program-Leader"
    },
    "ICY-Mission-Team-2-Admin" = {
      "name" = "ICY-Mission-Team-2-Admin"
    },
    "ICY-Mission-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Mission-Team-2-Team-Member" = {
      "name" = "ICY-Mission-Team-2-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Team-Member"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Program-Leader" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Program-Leader"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Admin" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Admin"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Team-Member" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Team-Member"
    },
    "ICY-Pacific-Rim-Team-1-Program-Leader" = {
      "name" = "ICY-Pacific-Rim-Team-1-Program-Leader"
    },
    "ICY-Pacific-Rim-Team-1-Admin" = {
      "name" = "ICY-Pacific-Rim-Team-1-Admin"
    },
    "ICY-Pacific-Rim-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Pacific-Rim-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Pacific-Rim-Team-1-Team-Member" = {
      "name" = "ICY-Pacific-Rim-Team-1-Team-Member"
    },
    "ICY-qathet-Powell-River-Team-1-Program-Leader" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Program-Leader"
    },
    "ICY-qathet-Powell-River-Team-1-Admin" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Admin"
    },
    "ICY-qathet-Powell-River-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-qathet-Powell-River-Team-1-Team-Member" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Team-Member"
    },
    "ICY-dummy-0" = {
      "name" = "ICY-dummy-0"
    },
    "ICY-dummy-1" = {
      "name" = "ICY-dummy-1"
    },
    "ICY-dummy-2" = {
      "name" = "ICY-dummy-2"
    },
    "ICY-dummy-3" = {
      "name" = "ICY-dummy-3"
    },
    "ICY-dummy-4" = {
      "name" = "ICY-dummy-4"
    },
    "ICY-dummy-5" = {
      "name" = "ICY-dummy-5"
    },
    "ICY-dummy-6" = {
      "name" = "ICY-dummy-6"
    },
    "ICY-dummy-7" = {
      "name" = "ICY-dummy-7"
    },
    "ICY-dummy-8" = {
      "name" = "ICY-dummy-8"
    },
    "ICY-dummy-9" = {
      "name" = "ICY-dummy-9"
    },
    "ICY-dummy-10" = {
      "name" = "ICY-dummy-10"
    },
    "ICY-dummy-11" = {
      "name" = "ICY-dummy-11"
    },
    "ICY-dummy-12" = {
      "name" = "ICY-dummy-12"
    },
    "ICY-dummy-13" = {
      "name" = "ICY-dummy-13"
    },
    "ICY-dummy-14" = {
      "name" = "ICY-dummy-14"
    },
    "ICY-dummy-15" = {
      "name" = "ICY-dummy-15"
    },
    "ICY-dummy-16" = {
      "name" = "ICY-dummy-16"
    },
    "ICY-dummy-17" = {
      "name" = "ICY-dummy-17"
    },
    "ICY-dummy-18" = {
      "name" = "ICY-dummy-18"
    },
    "ICY-dummy-19" = {
      "name" = "ICY-dummy-19"
    },
    "ICY-dummy-20" = {
      "name" = "ICY-dummy-20"
    },
    "ICY-dummy-21" = {
      "name" = "ICY-dummy-21"
    },
    "ICY-dummy-22" = {
      "name" = "ICY-dummy-22"
    },
    "ICY-dummy-23" = {
      "name" = "ICY-dummy-23"
    },
    "ICY-dummy-24" = {
      "name" = "ICY-dummy-24"
    },
    "ICY-dummy-25" = {
      "name" = "ICY-dummy-25"
    },
    "ICY-dummy-26" = {
      "name" = "ICY-dummy-26"
    },
    "ICY-dummy-27" = {
      "name" = "ICY-dummy-27"
    },
    "ICY-dummy-28" = {
      "name" = "ICY-dummy-28"
    },
    "ICY-dummy-29" = {
      "name" = "ICY-dummy-29"
    },
    "ICY-dummy-30" = {
      "name" = "ICY-dummy-30"
    },
    "ICY-dummy-31" = {
      "name" = "ICY-dummy-31"
    },
    "ICY-dummy-32" = {
      "name" = "ICY-dummy-32"
    },
    "ICY-dummy-33" = {
      "name" = "ICY-dummy-33"
    },
    "ICY-dummy-34" = {
      "name" = "ICY-dummy-34"
    },
    "ICY-dummy-35" = {
      "name" = "ICY-dummy-35"
    },
    "ICY-dummy-36" = {
      "name" = "ICY-dummy-36"
    },
    "ICY-dummy-37" = {
      "name" = "ICY-dummy-37"
    },
    "ICY-dummy-38" = {
      "name" = "ICY-dummy-38"
    },
    "ICY-dummy-39" = {
      "name" = "ICY-dummy-39"
    },
    "ICY-dummy-40" = {
      "name" = "ICY-dummy-40"
    },
    "ICY-dummy-41" = {
      "name" = "ICY-dummy-41"
    },
    "ICY-dummy-42" = {
      "name" = "ICY-dummy-42"
    },
    "ICY-dummy-43" = {
      "name" = "ICY-dummy-43"
    },
    "ICY-dummy-44" = {
      "name" = "ICY-dummy-44"
    },
    "ICY-dummy-45" = {
      "name" = "ICY-dummy-45"
    },
    "ICY-dummy-46" = {
      "name" = "ICY-dummy-46"
    },
    "ICY-dummy-47" = {
      "name" = "ICY-dummy-47"
    },
    "ICY-dummy-48" = {
      "name" = "ICY-dummy-48"
    },
    "ICY-dummy-49" = {
      "name" = "ICY-dummy-49"
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

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins"
  ]
}
