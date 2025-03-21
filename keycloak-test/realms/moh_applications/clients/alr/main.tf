resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "ALR"
  consent_required                    = false
  description                         = "The ALR system supports in licensing ALR facilities and maintaining an up-to-date record of inspection status."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Assisted Living Registry"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcministryofhealth-environmentalh2--stage.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--dev.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--stx01.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--qa01.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--dat01.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--hotfixdev.sandbox.lightning.force.com/*",
    "https://bcministryofhealth-environmentalh2--hotfixqa.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--hotfixdev.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--hotfixqa.sandbox.lightning.force.com/*",
    "https://bcministryofhealth-environmentalh2--qa.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--demo.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--uat.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--dat.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--opsqa.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-environmentalh2--opsdev.sandbox.my.salesforce.com/*"
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    #browser-idp-restriction flow
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "email",
    "profile",
    "roles",
    "web-origins",
    "idir_aad",
    "basic"
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-ALR" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "ALR"
  name                        = "ALR Role Mapper"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "ALR_Admin_Clerk" : {
      "name" : "ALR_Admin_Clerk",
    },
    "ALR_Admin_Data_Analyst" : {
      "name" : "ALR_Admin_Data_Analyst",
    },
    "ALR_Data_Analyst" : {
      "name" : "ALR_Data_Analyst",
    },
    "ALR_Investigator" : {
      "name" : "ALR_Investigator",
    },
    "ALR_Registrar" : {
      "name" : "ALR_Registrar",
    },
    "ALR_Registrar_Leadership" : {
      "name" : "ALR_Registrar_Leadership",
    },
    "ALR_Registrar_Leadership_Data_Analyst" : {
      "name" : "ALR_Registrar_Leadership_Data_Analyst",
    },
    "ALR_Leadership" : {
      "name" : "ALR_Leadership",
    },
    "ALR_Ops_Support_1" : {
      "name" : "ALR_Ops_Support_1",
    },
    "ALR_Ops_Support_2" : {
      "name" : "ALR_Ops_Support_2",
    },
    "ALR_SDPR" : {
      "name" : "ALR_SDPR",
    },
    "ALR_MMHA" : {
      "name" : "ALR_MMHA",
    },
    "ALR_Data_Investigator" : {
      "name" : "ALR_Data_Investigator",
    }
  }
}
