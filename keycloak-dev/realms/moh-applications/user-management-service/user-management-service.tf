resource "keycloak_openid_client" "CLIENT" {
  access_type                         = "CONFIDENTIAL"
  access_token_lifespan               = "1800"
  backchannel_logout_session_required = false
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "USER-MANAGEMENT-SERVICE"
  consent_required                    = false
  description                         = ""
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = true
  standard_flow_enabled               = false
  use_refresh_tokens                  = false
  valid_redirect_uris = [
  ]
  web_origins = []
  admin_url   = ""
}
module "client-roles" {
  source    = "../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "manage-user-roles" = {
      "name"        = "manage-user-roles"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sfds" = {
      "name"        = "view-client-sfds"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-metrics" = {
      "name"        = "view-metrics"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sa-hibc-service-bc-portal" = {
      "name"        = "view-client-sa-hibc-service-bc-portal"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-hcimweb" = {
      "name"        = "view-client-hcimweb"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-eacl" = {
      "name"        = "view-client-eacl"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-uci-sso" = {
      "name"        = "view-client-uci-sso"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-hcimweb_huat" = {
      "name"        = "view-client-hcimweb_huat"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-maid" = {
      "name"        = "view-client-maid"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sa-sfdc" = {
      "name"        = "view-client-sa-sfdc"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-events" = {
      "name"        = "view-events"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "create-user" = {
      "name"        = "create-user"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-emcod" = {
      "name"        = "view-client-emcod"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sat-case-management-1" = {
      "name"        = "view-client-sat-case-management-1"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-pidp-service" = {
      "name"        = "view-client-pidp-service"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-swt" = {
      "name"        = "view-client-swt"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-plr" = {
      "name"        = "view-client-plr"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-maid-case-management-1" = {
      "name"        = "view-client-maid-case-management-1"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-groups" = {
      "name"        = "view-groups"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "manage-user-details" = {
      "name"        = "manage-user-details"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sa-dbaac-portal" = {
      "name"        = "view-client-sa-dbaac-portal"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-hamis" = {
      "name"        = "view-client-hamis"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-hscis" = {
      "name"        = "view-client-hscis"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-fmdb" = {
      "name"        = "view-client-fmdb"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-clients" = {
      "name"        = "view-clients"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "manage-user-groups" = {
      "name"        = "manage-user-groups"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sat-eforms" = {
      "name"        = "view-client-sat-eforms"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-bcer-cp" = {
      "name"        = "view-client-bcer-cp"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-miwt" = {
      "name"        = "view-client-miwt"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-gis" = {
      "name"        = "view-client-gis"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-sat-drug-management-1" = {
      "name"        = "view-client-sat-drug-management-1"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-users" = {
      "name"        = "view-users"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-hem" = {
      "name"        = "view-client-hem"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-webcaps" = {
      "name"        = "view-client-webcaps"
      "description" = ""
      "composite_roles" = [
      ]
    },
    "view-client-mspdirect-service" = {
      "name"        = "view-client-mspdirect-service"
      "description" = ""
      "composite_roles" = [
      ]
    },
  }
}

module "scope-mappings" {
	source = "../../../../modules/scope-mappings"
	realm_id = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	roles = {
		"realm-management/manage-users" = var.realm-management.ROLES["manage-users"].id,
		"realm-management/query-clients" = var.realm-management.ROLES["query-clients"].id,
		"realm-management/query-groups" = var.realm-management.ROLES["query-groups"].id,
		"realm-management/view-users" = var.realm-management.ROLES["view-users"].id,
		"realm-management/query-users" = var.realm-management.ROLES["query-users"].id,
		"realm-management/view-clients" = var.realm-management.ROLES["view-clients"].id,
		"realm-management/view-events" = var.realm-management.ROLES["view-events"].id,
	}
}


variable "realm-management" {
}

output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}
output "ROLES" {
  value = module.client-roles.ROLES
}