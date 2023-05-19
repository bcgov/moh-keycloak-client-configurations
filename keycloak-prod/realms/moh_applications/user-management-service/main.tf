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
    "view-client-eacl" = {
      "name" = "view-client-eacl"
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
    },
    "view-client-hcap-fe" = {
      "name" = "view-client-hcap-fe"
    },
    "view-client-hcimweb" = {
      "name" = "view-client-hcimweb"
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
    "view-client-mspdirect-service" = {
      "name" = "view-client-mspdirect-service"
    },
    "view-client-pho-rsc" = {
      "name" = "view-client-pho-rsc"
    },
    "view-client-pidp-service" = {
      "name" = "view-client-pidp-service"
    },
    "view-client-plr" = {
      "name" = "view-client-plr"
    },
    "view-client-prime-application" = {
      "name" = "view-client-prime-application"
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
    "MSPDIRECT-SERVICE/MANAGEMSPPAYEENUMBER" = var.MSPDIRECT-SERVICE.ROLES["MANAGEMSPPAYEENUMBER"].id,
    "realm-management/manage-users"          = var.realm-management.ROLES["manage-users"].id,
    "realm-management/query-clients"         = var.realm-management.ROLES["query-clients"].id,
    "realm-management/query-groups"          = var.realm-management.ROLES["query-groups"].id,
    "realm-management/query-users"           = var.realm-management.ROLES["query-users"].id,
    "realm-management/view-clients"          = var.realm-management.ROLES["view-clients"].id,
    "realm-management/view-events"           = var.realm-management.ROLES["view-events"].id,
    "realm-management/view-users"            = var.realm-management.ROLES["view-users"].id,
    "ORGANIZATIONS-API/get-org"              = var.ORGANIZATIONS-API.ROLES["get-org"].id,
    "ORGANIZATIONS-API/add-org"              = var.ORGANIZATIONS-API.ROLES["add-org"].id,
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
    "MSPDIRECT-SERVICE/MANAGEMSPPAYEENUMBER" = {
      "client_id" = var.MSPDIRECT-SERVICE.CLIENT.id,
      "role_id"   = "MANAGEMSPPAYEENUMBER"
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
