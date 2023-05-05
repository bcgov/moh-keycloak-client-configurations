resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PRIMARY-CARE"
  consent_required                    = false
  description                         = "Primary Care"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Primary Care"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://healthbc--pmycareidp.sandbox.my.salesforce.com/*",
    "https://healthbc--pmycareidp.sandbox.my.site.com/*",
    "https://healthbc--hlthbcdevx.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcdevx.sandbox.my.site.com/*",
    "https://healthbc--hlthbcqax.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcqax.sandbox.my.site.com/*",
    "https://healthbc--hlthbccix.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbccix.sandbox.my.site.com/*",
    "https://healthbc--hlthbccix2.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbccix2.sandbox.my.site.com/*",
    "https://healthbc--hlthbcstx.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcstx.sandbox.my.site.com/*",
    "https://healthbc--hlthbcuat.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcuat.sandbox.my.site.com/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PRIMARY-CARE"
  name                        = "Client Role Mapper"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

resource "keycloak_openid_user_attribute_protocol_mapper" "common_provider_number" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "common_provider_number"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "common_provider_number"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "bcsc_guid" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name      = "bcsc_guid"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "bcsc_guid"
  user_attribute  = "bcsc_guid"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "pidp_email" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name      = "pidp_email"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "pidp_email"
  user_attribute  = "pidp_email"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "endorser_data" {
  add_to_id_token     = false
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name      = "endorser_data"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "endorser_data"
  user_attribute  = "endorser_data"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
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

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  optional_scopes = [
    "offline_access"
  ]
}

module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "PC_Patient" = {
      "name"        = "PC_Patient"
      "description" = ""
    },
    "PC_Practitioner" = {
      "name"        = "PC_Practitioner"
      "description" = ""
    },
    "IMITS_PC_System_Admin" = {
      "name"        = "IMITS_PC_System_Admin"
      "description" = ""
    },
    "IMITS_PC_Ops_Support" = {
      "name"        = "IMITS_PC_Ops_Support"
      "description" = ""
    },
    "PC_Attachment_Coordinator" = {
      "name"        = "PC_Attachment_Coordinator"
      "description" = ""
    },
    "PC_HCR_Support_Tier2" = {
      "name"        = "PC_HCR_Support_Tier2"
      "description" = ""
    },
    "PC_HCR_Support_Tier1" = {
      "name"        = "PC_HCR_Support_Tier1"
      "description" = ""
    },
  }
}

module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"          = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER" = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD" = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP" = var.LICENCE-STATUS.ROLES["RNP"].id
  }
}
