resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "1800"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "USER-MANAGEMENT-SERVICE"
  consent_required                    = false
  description                         = "The purpose of the User Management API service is to extend the functionality of Keycloak to provide better security and functionality to the underlying Keycloak APIs."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = true
  valid_redirect_uris = [
  ]
  web_origins = [
  ]
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "create-user" = {
      "name" = "create-user"
    },
    "manage-user-details" = {
      "name" = "manage-user-details"
    },
    "manage-all-groups" = {
      "name" = "manage-all-groups"
    },
    "manage-org" = {
      "name" = "manage-org"
    },
    "manage-own-groups" = {
      "name" = "manage-own-groups"
    },
    "manage-user-roles" = {
      "name" = "manage-user-roles"
    },
    "view-client-bcer-cp" = {
      "name" = "view-client-bcer-cp"
    },
    "view-client-dmft-webapp" = {
      "name" = "view-client-dmft-webapp"
    },
    "view-client-eacl" = {
      "name" = "view-client-eacl"
    },
    "view-client-eacl_stg" = {
      "name" = "view-client-eacl_stg"
    },
    "view-client-emcod" = {
      "name" = "view-client-emcod"
    },
    "view-client-fmdb" = {
      "name" = "view-client-fmdb"
    },
    "view-client-gis" = {
      "name" = "view-client-gis"
    },
    "view-client-hamis" = {
      "name" = "view-client-hamis"
    }
    "view-client-hcap-fe" = {
      "name" = "view-client-hcap-fe"
    },
    "view-client-hcimweb_hiat1" = {
      "name" = "view-client-hcimweb_hiat1"
    },
    "view-client-hcimweb_hiat2" = {
      "name" = "view-client-hcimweb_hiat2"
    },
    "view-client-hcimweb_hiat3" = {
      "name" = "view-client-hcimweb_hiat3"
    },
    "view-client-hsiar" = {
      "name" = "view-client-hsiar"
    }
    "view-client-hcimweb_hs1" = {
      "name" = "view-client-hcimweb_hs1"
    },
    "view-client-hcimweb_hsit" = {
      "name" = "view-client-hcimweb_hsit"
    },
    "view-client-hcimweb_huat" = {
      "name" = "view-client-hcimweb_huat"
    },
    "view-client-hem" = {
      "name" = "view-client-hem"
    },
    "view-client-hscis" = {
      "name" = "view-client-hscis"
    },
    "view-client-licence-status" = {
      "name" = "view-client-licence-status"
    },
    "view-client-maid" = {
      "name" = "view-client-maid"
    },
    "view-client-miwt" = {
      "name" = "view-client-miwt"
    },
    "view-client-miwt_stg" = {
      "name" = "view-client-miwt_stg"
    },
    "view-client-mspdirect-service" = {
      "name" = "view-client-mspdirect-service"
    },
    "view-client-mspdirect-service-uat" = {
      "name" = "view-client-mspdirect-service-uat"
    },
    "view-client-pidp-service" = {
      "name" = "view-client-pidp-service"
    },
    "view-client-plr_conf" = {
      "name" = "view-client-plr_conf"
    },
    "view-client-plr_flvr" = {
      "name" = "view-client-plr_flvr"
    },
    "view-client-plr_iat" = {
      "name" = "view-client-plr_iat"
    },
    "view-client-plr_rev" = {
      "name" = "view-client-plr_rev"
    },
    "view-client-plr_sit" = {
      "name" = "view-client-plr_sit"
    },
    "view-client-plr_stg" = {
      "name" = "view-client-plr_stg"
    },
    "view-client-plr_uat" = {
      "name" = "view-client-plr_uat"
    },
    "view-client-primary-care" = {
      "name" = "view-client-primary-care"
    },
    "view-client-prime-application-local" = {
      "name" = "view-client-prime-application-local"
    },
    "view-client-prime-application-test" = {
      "name" = "view-client-prime-application-test"
    },
    "view-client-prp-service" = {
      "name" = "view-client-prp-service"
    },
    "view-client-sa-dbaac-portal" = {
      "name" = "view-client-sa-dbaac-portal"
    },
    "view-client-sa-hibc-service-bc-portal" = {
      "name" = "view-client-sa-hibc-service-bc-portal"
    },
    "view-client-sa-sfdc" = {
      "name" = "view-client-sa-sfdc"
    },
    "view-client-sat-eforms" = {
      "name" = "view-client-sat-eforms"
    },
    "view-client-sfds" = {
      "name" = "view-client-sfds"
    },
    "view-client-swt" = {
      "name" = "view-client-swt"
    },
    "view-client-swt_stg" = {
      "name" = "view-client-swt_stg"
    },
    "view-client-tap" = {
      "name" = "view-client-tap"
    },
    "view-client-webcaps" = {
      "name" = "view-client-webcaps"
    },
    "view-clients" = {
      "name" = "view-clients"
    },
    "view-events" = {
      "name" = "view-events"
    },
    "view-groups" = {
      "name" = "view-groups"
    },
    "view-metrics" = {
      "name" = "view-metrics"
    },
    "view-users" = {
      "name" = "view-users"
    },
  }
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
  add_to_id_token  = true
  claim_name       = "clientHost"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client Host"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientHost"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
  add_to_id_token  = true
  claim_name       = "clientId"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client ID"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientId"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
  add_to_id_token  = true
  claim_name       = "clientAddress"
  claim_value_type = "String"
  client_id        = keycloak_openid_client.CLIENT.id
  name             = "Client IP Address"
  realm_id         = keycloak_openid_client.CLIENT.realm_id
  session_note     = "clientAddress"
}
module "scope-mappings" {
  source    = "../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "realm-management/manage-users"  = var.realm-management.ROLES["manage-users"].id,
    "realm-management/query-clients" = var.realm-management.ROLES["query-clients"].id,
    "realm-management/query-groups"  = var.realm-management.ROLES["query-groups"].id,
    "realm-management/query-users"   = var.realm-management.ROLES["query-users"].id,
    "realm-management/view-clients"  = var.realm-management.ROLES["view-clients"].id,
    "realm-management/view-events"   = var.realm-management.ROLES["view-events"].id,
    "realm-management/view-users"    = var.realm-management.ROLES["view-users"].id,
    "ORGANIZATIONS-API/get-org"      = var.ORGANIZATIONS-API.ROLES["get-org"].id,
    "ORGANIZATIONS-API/add-org"      = var.ORGANIZATIONS-API.ROLES["add-org"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "offline_access"    = "offline_access",
    "uma_authorization" = "uma_authorization",
  }
  client_roles = {
    "account/manage-account" = {
      "client_id" = var.account.CLIENT.id,
      "role_id"   = "manage-account"
    }
    "account/view-profile" = {
      "client_id" = var.account.CLIENT.id,
      "role_id"   = "view-profile"
    }
    "realm-management/manage-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "manage-users"
    }
    "realm-management/view-clients" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "realm-management/view-events" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-events"
    }
    "realm-management/view-users" = {
      "client_id" = var.realm-management.CLIENT.id,
      "role_id"   = "view-users"
    }
    "ORGANIZATIONS-API/get-org" = {
      "client_id" = var.ORGANIZATIONS-API.CLIENT.id,
      "role_id"   = "get-org"
    }
    "ORGANIZATIONS-API/add-org" = {
      "client_id" = var.ORGANIZATIONS-API.CLIENT.id,
      "role_id"   = "add-org"
    }
  }
}
