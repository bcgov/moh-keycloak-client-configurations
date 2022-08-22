resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "PIDP-SERVICE"
  consent_required                    = false
  description                         = "Provider Identity Portal"
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
    "ADMIN" = {
      "name"        = "ADMIN"
      "description" = ""
    },
    "USER" = {
      "name"        = "USER"
      "description" = ""
    },
    "feature_amh_demo" = {
      "name"        = "feature_amh_demo"
      "description" = ""
    },
    "feature_pidp_demo" = {
      "name"        = "feature_pidp_demo"
      "description" = ""
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
    "USER-MANAGEMENT-SERVICE/create-user"              = var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-details"      = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-roles"        = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb"      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb"].id,
    "USER-MANAGEMENT-SERVICE/view-client-pidp-service" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sat-eforms"   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sat-eforms"].id,
    "USER-MANAGEMENT-SERVICE/view-client-uci-sso"      = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-uci-sso"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"             = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-users"               = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,
  }
}
module "service-account-roles" {
  source                  = "../../../../modules/service-account-roles"
  realm_id                = keycloak_openid_client.CLIENT.realm_id
  client_id               = keycloak_openid_client.CLIENT.id
  service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
  realm_roles = {
    "default-roles-moh_applications" = "default-roles-moh_applications",
  }
  client_roles = {
    "USER-MANAGEMENT-SERVICE/create-user" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "create-user"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-details" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "manage-user-details"
    }
    "USER-MANAGEMENT-SERVICE/manage-user-roles" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "manage-user-roles"
    }
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-hcimweb"
    }
    "USER-MANAGEMENT-SERVICE/view-client-pidp-service" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-pidp-service"
    }
    "USER-MANAGEMENT-SERVICE/view-client-sat-eforms" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-sat-eforms"
    }
    "USER-MANAGEMENT-SERVICE/view-client-uci-sso" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-uci-sso"
    }
    "USER-MANAGEMENT-SERVICE/view-clients" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-clients"
    }
    "USER-MANAGEMENT-SERVICE/view-users" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-users"
    }
  }
}
