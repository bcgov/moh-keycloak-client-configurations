resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSPP"
  consent_required                    = false
  description                         = "The Health System Performance Portal (HSPP) provides a panoramic analytical view of the health system in British Columbia across the four pillars of the Performance Management Framework"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HSPP"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://uathspp.hlth.gov.bc.ca/*",
    "https://devhspp.healthideas.gov.bc.ca/*",
    "https://devsecure.healthideas.gov.bc.ca/*",
    "https://moh-dms-m-sit-as-hspp.azurewebsites.net/*",
    "https://sithspp.hlth.gov.bc.ca/*",
    "https://uathspp.healthideas.gov.bc.ca/*",
    "https://devhspp.hlth.gov.bc.ca/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "HSPP"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_access_token = true
  add_to_id_token     = true
  claim_name          = "identity_provider"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "IDP"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
  session_note        = "identity_provider"
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_mailboxOrgCode" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_mailboxOrgCode"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_mailboxOrgCode"
  user_attribute  = "idir_mailboxOrgCode"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_client_role_protocol_mapper" "licence_status_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "licence_status"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "LICENCE-STATUS"
  multivalued                 = true
  name                        = "licence status"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
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
    "LICENCE-STATUS/PHARM"        = var.LICENCE-STATUS.ROLES["PHARM"].id
  }
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
    "HSPP_ALL" = {
      "name" = "HSPP_ALL"
    },
    "HSPP_HumanResource" = {
      "name" = "HSPP_HumanResource"
    },
    "HSPP_OKR" = {
      "name" = "HSPP_OKR"
    },
    "HSPP_ReportProgram_All" = {
      "name" = "HSPP_ReportProgram_All"
    },
    "HSPP_ReportProgram_Invictus" = {
      "name" = "HSPP_ReportProgram_Invictus"
    },
    "HSPP_ReportProgram_OKR" = {
      "name" = "HSPP_ReportProgram_OKR"
    },
    "HSPP_ReportSection_All" = {
      "name" = "HSPP_ReportSection_All"
    },
    "HSPP_ReportSection_Invictus" = {
      "name" = "HSPP_ReportSection_Invictus"
    },
    "HSPP_ReportSection_OKR" = {
      "name" = "HSPP_ReportSection_OKR"
    },
    "HSPP_Report_Invictus" = {
      "name" = "HSPP_Report_Invictus"
    },
    "HSPP_Restricted_ACFT" = {
      "name" = "HSPP_Restricted_ACFT"
    },
    "HSPP_Restricted_BCCStat" = {
      "name" = "HSPP_Restricted_BCCStat"
    },
    "HSPP_Restricted_CVC" = {
      "name" = "HSPP_Restricted_CVC"
    },
    "HSPP_Restricted_DAD" = {
      "name" = "HSPP_Restricted_DAD"
    },
    "HSPP_Restricted_ED" = {
      "name" = "HSPP_Restricted_ED"
    },
    "HSPP_Restricted_HIDT" = {
      "name" = "HSPP_Restricted_HIDT"
    },
    "HSPP_Restricted_LFP" = {
      "name" = "HSPP_Restricted_LFP"
    },
    "HSPP_Restricted_MHAD" = {
      "name" = "HSPP_Restricted_MHAD"
    },
    "HSPP_Restricted_MSCP" = {
      "name" = "HSPP_Restricted_MSCP"
    },
    "HSPP_Restricted_NACRS" = {
      "name" = "HSPP_Restricted_NACRS"
    }
    "HSPP_Restricted_PCR" = {
      "name" = "HSPP_Restricted_PCR"
    },
    "HSPP_Restricted_PCS" = {
      "name" = "HSPP_Restricted_PCS"
    },
    "HSPP_Restricted_PDAO" = {
      "name" = "HSPP_Restricted_PDAO"
    },
    "HSPP_Restricted_PEP" = {
      "name" = "HSPP_Restricted_PEP"
    },
    "HSPP_Restricted_PublicISC" = {
      "name" = "HSPP_Restricted_PublicISC"
    },
    "HSPP_Restricted_SAN" = {
      "name" = "HSPP_Restricted_SAN"
    },
    "HSPP_Restricted_UPCC" = {
      "name" = "HSPP_Restricted_UPCC"
    },
    "HSPP_Restricted_UserStatistics" = {
      "name" = "HSPP_Restricted_UserStatistics"
    },
    "HSPP_Restricted_PASED" = {
      "name" = "HSPP_Restricted_PASED"
    },
    "HSPP_Restricted_DART" = {
      "name" = "HSPP_Restricted_DART"
    },
    "HSPP_ReportSection_DART" = {
      "name" = "HSPP_ReportSection_DART"
    },
    "HSPP_LTC" = {
      "name" = "HSPP_LTC"
    },
    "HSPP_ReportProgram_LTC" = {
      "name" = "HSPP_ReportProgram_LTC"
    },
    "HSPP_ReportSection_LTC" = {
      "name" = "HSPP_ReportSection_LTC"
    },
    "HSPP_Restricted_HAH" = {
      "name" = "HSPP_Restricted_HAH"
    },
    "HSPP_Restricted_CDR" = {
      "name" = "HSPP_Restricted_CDR"
    },
    "HSPP_Restricted_CHSP" = {
      "name" = "HSPP_Restricted_CHSP"
    },
    "HSPP_Restricted_MEDISLTC" = {
      "name" = "HSPP_Restricted_MEDISLTC"
    },
    "HSPP_Restricted_CIHI" = {
      "name" = "HSPP_Restricted_CIHI"
    },
    "HSPP_Restricted_LTC_FHA" = {
      "name" = "HSPP_Restricted_LTC_FHA"
    },
    "HSPP_Restricted_LTC_IHA" = {
      "name" = "HSPP_Restricted_LTC_IHA"
    },
    "HSPP_Restricted_LTC_NHA" = {
      "name" = "HSPP_Restricted_LTC_NHA"
    },
    "HSPP_Restricted_LTC_VCHA" = {
      "name" = "HSPP_Restricted_LTC_VCHA"
    },
    "HSPP_Restricted_LTC_VIHA" = {
      "name" = "HSPP_Restricted_LTC_VIHA"
    },
    "HSPP_ReportProgram_Operations" = {
      "name" = "HSPP_ReportProgram_Operations"
    },
    "HSPP_ReportSection_Operations" = {
      "name" = "HSPP_ReportSection_Operations"
    },
    "HSPP_Operations_PPM_PPD" = {
      "name" = "HSPP_Operations_PPM_PPD"
    },
    "HSPP_Operations_CCS_PA" = {
      "name" = "HSPP_Operations_CCA_PA"
    },
    "HSPP_Operations_CCS_SDA" = {
      "name" = "HSPP_Operations_CCS_SDA"
    },
    "HSPP_Operations_PAW_HA" = {
      "name" = "HSPP_Operations_PAW_HA"
    },
    "HSPP_Operations_PMP" = {
      "name" = "HSPP_Operations_PMP"
    }
  }
}
