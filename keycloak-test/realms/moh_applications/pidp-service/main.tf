resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
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
      "name" = "ADMIN"
    },
    "USER" = {
      "name" = "USER"
    },
    "feature_pidp_demo" = {
      "name" = "feature_pidp_demo"
    },
    "view_endorsement_data" = {
      "name" = "view_endorsement_data"
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
    "USER-MANAGEMENT-SERVICE/create-user"                = var.USER-MANAGEMENT-SERVICE.ROLES["create-user"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-details"        = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-details"].id,
    "USER-MANAGEMENT-SERVICE/manage-user-roles"          = var.USER-MANAGEMENT-SERVICE.ROLES["manage-user-roles"].id,
    "USER-MANAGEMENT-SERVICE/view-client-dmft-webapp"    = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-dmft-webapp"].id,
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_huat"   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-hcimweb_huat"].id,
    "USER-MANAGEMENT-SERVICE/view-client-licence-status" = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-licence-status"].id,
    "USER-MANAGEMENT-SERVICE/view-client-pidp-service"   = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-pidp-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-prp-service"    = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-prp-service"].id,
    "USER-MANAGEMENT-SERVICE/view-client-sat-eforms"     = var.USER-MANAGEMENT-SERVICE.ROLES["view-client-sat-eforms"].id,
    "USER-MANAGEMENT-SERVICE/view-clients"               = var.USER-MANAGEMENT-SERVICE.ROLES["view-clients"].id,
    "USER-MANAGEMENT-SERVICE/view-users"                 = var.USER-MANAGEMENT-SERVICE.ROLES["view-users"].id,

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
    "USER-MANAGEMENT-SERVICE/view-client-dmft-webapp" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-dmft-webapp"
    }
    "USER-MANAGEMENT-SERVICE/view-client-hcimweb_huat" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-hcimweb_huat"
    }
    "USER-MANAGEMENT-SERVICE/view-client-licence-status" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-licence-status"
    }
    "USER-MANAGEMENT-SERVICE/view-client-pidp-service" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-pidp-service"
    }
    "USER-MANAGEMENT-SERVICE/view-client-prp-service" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-prp-service"
    }
    "USER-MANAGEMENT-SERVICE/view-client-sat-eforms" = {
      "client_id" = var.USER-MANAGEMENT-SERVICE.CLIENT.id,
      "role_id"   = "view-client-sat-eforms"
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
