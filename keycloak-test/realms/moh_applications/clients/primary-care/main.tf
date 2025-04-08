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
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "https://healthbc--hotfixdev.sandbox.my.salesforce.com/*",
    "https://healthbc--hotfixdev.sandbox.my.site.com/*",
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
    "https://healthbc--hlthbcdevn.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcdevn.sandbox.my.site.com/*",
    "https://healthbc--hlthbcprvx.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcprvx.sandbox.my.site.com/*",
    "https://healthbc--hlthbcint.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcint.sandbox.my.site.com/*",
    "https://uat.bchealthprovider.ca/*",
    "https://healthbc--hlthbcuatx.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcuatx.sandbox.my.site.com/*",
    "https://healthbc--hlthbctrn.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbctrn.sandbox.my.site.com/*",
    "https://healthbc--hlthbctrnx.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcuatx.sandbox.lightning.force.com/*",
    "https://healthbc--hlthbcemr.sandbox.my.salesforce.com/*",
    "https://healthbc--hlthbcemr.sandbox.my.site.com/*",
    "https://healthbc--previewqa.sandbox.my.salesforce.com/*",
    "https://healthbc--previewqa.sandbox.my.site.com/*",
    "https://healthbc--hotfixqa.sandbox.my.salesforce.com/*",
    "https://healthbc--hotfixqa.sandbox.my.site.com/*"
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-PRIMARY-CARE" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "PRIMARY-CARE"
  name                        = "Client Role Mapper for PRIMARY-CARE"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-LICENCE-STATUS" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "LICENCE-STATUS"
  name                        = "Client Role Mapper for LICENCE-STATUS"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

resource "keycloak_openid_user_attribute_protocol_mapper" "bcsc_guid" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "bcsc_guid"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "bcsc_guid"
  user_attribute      = "bcsc_guid"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "pidp_email" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "pidp_email"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "pidp_email"
  user_attribute      = "pidp_email"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "endorser_data" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "endorser_data"
  claim_value_type    = "JSON"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "endorser_data"
  user_attribute      = "endorser_data"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "cpn" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "common_provider_number"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "cpn"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token     = true
  add_to_access_token = true
  claim_name          = "identity_provider"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "IDP"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
  session_note        = "identity_provider"
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins",
    "basic"
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
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "Default_Role" = {
      "name"        = "Default_Role"
      "description" = ""
    },
    "PC_Patient" = {
      "name"        = "PC_Patient"
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
    "PC_Navigator" = {
      "name"        = "PC_Navigator"
      "description" = ""
    },
    "PC_Provider_Support_Tier0" = {
      "name"        = "PC_Provider_Support_Tier0"
      "description" = ""
    },
    "PC_Provider_Support_Tier1" = {
      "name"        = "PC_Provider_Support_Tier1"
      "description" = ""
    },
    "PC_Reporting_User" = {
      "name"        = "PC_Reporting_User"
      "description" = ""
    },
    "HealthlinkBC_IssueManager" = {
      "name"        = "HealthlinkBC_IssueManager"
      "description" = ""
    },
    "HealthlinkBC_CPS" = {
      "name"        = "HealthlinkBC_CPS"
      "description" = ""
    },
    "HealthlinkBC_Nurse" = {
      "name"        = "HealthlinkBC_Nurse"
      "description" = ""
    },
    "HealthlinkBC_NurseLead" = {
      "name"        = "HealthlinkBC_NurseLead"
      "description" = ""
    },
    "HealthlinkBC_Dietitian" = {
      "name"        = "HealthlinkBC_Dietitian"
      "description" = ""
    },
    "HealthlinkBC_DietitianLead" = {
      "name"        = "HealthlinkBC_DietitianLead"
      "description" = ""
    },
    "HealthlinkBC_Pharmacist" = {
      "name"        = "HealthlinkBC_Pharmacist"
      "description" = ""
    },
    "HealthlinkBC_QEP" = {
      "name"        = "HealthlinkBC_QEP"
      "description" = ""
    },
    "HealthlinkBC_QEPLead" = {
      "name"        = "HealthlinkBC_QEPLead"
      "description" = ""
    },
    "PC_NavigatorLead" = {
      "name"        = "PC_NavigatorLead"
      "description" = ""
    },
    "HealthlinkBC_PharmacistLead" = {
      "name"        = "HealthlinkBC_PharmacistLead"
      "description" = ""
    },
    "HealthLinkBC_BusinessInformationTeam" = {
      "name"        = "HealthLinkBC_BusinessInformationTeam"
      "description" = ""
    },
  }
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"          = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER" = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD"           = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP"          = var.LICENCE-STATUS.ROLES["RNP"].id
  }
}
