resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan               = "1800"
    access_type                         = "CONFIDENTIAL"
    backchannel_logout_session_required = false
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
    valid_redirect_uris                 = [
    ]
    web_origins                         = [
    ]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "create-user" = {
            "name" = "create-user"
            "description" = ""
        },
        "manage-user-details" = {
            "name" = "manage-user-details"
            "description" = ""
        },
        "manage-user-groups" = {
            "name" = "manage-user-groups"
            "description" = ""
        },
        "manage-user-roles" = {
            "name" = "manage-user-roles"
            "description" = ""
        },
        "view-client-bcer-cp" = {
            "name" = "view-client-bcer-cp"
            "description" = ""
        },
        "view-client-eacl" = {
            "name" = "view-client-eacl"
            "description" = ""
        },
        "view-client-emcod" = {
            "name" = "view-client-emcod"
            "description" = ""
        },
        "view-client-fmdb" = {
            "name" = "view-client-fmdb"
            "description" = ""
        },
        "view-client-gis" = {
            "name" = "view-client-gis"
            "description" = ""
        },
        "view-client-hamis" = {
            "name" = "view-client-hamis"
            "description" = ""
        },
        "view-client-hcimweb" = {
            "name" = "view-client-hcimweb"
            "description" = ""
        },
        "view-client-hcimweb_hd2" = {
            "name" = "view-client-hcimweb_hd2"
            "description" = ""
        },
        "view-client-hem" = {
            "name" = "view-client-hem"
            "description" = ""
        },
        "view-client-hscis" = {
            "name" = "view-client-hscis"
            "description" = ""
        },
        "view-client-maid" = {
            "name" = "view-client-maid"
            "description" = ""
        },
        "view-client-miwt" = {
            "name" = "view-client-miwt"
            "description" = ""
        },
        "view-client-mspdirect-service" = {
            "name" = "view-client-mspdirect-service"
            "description" = ""
        },
        "view-client-pidp-service" = {
            "name" = "view-client-pidp-service"
            "description" = ""
        },
        "view-client-plr" = {
            "name" = "view-client-plr"
            "description" = ""
        },
        "view-client-sa-dbaac-portal" = {
            "name" = "view-client-sa-dbaac-portal"
            "description" = ""
        },
        "view-client-sa-hibc-service-bc-portal" = {
            "name" = "view-client-sa-hibc-service-bc-portal"
            "description" = ""
        },
        "view-client-sa-sfdc" = {
            "name" = "view-client-sa-sfdc"
            "description" = ""
        },
        "view-client-sat-case-management-1" = {
            "name" = "view-client-sat-case-management-1"
            "description" = ""
        },
        "view-client-sat-drug-management-1" = {
            "name" = "view-client-sat-drug-management-1"
            "description" = ""
        },
        "view-client-sat-eforms" = {
            "name" = "view-client-sat-eforms"
            "description" = ""
        },
        "view-client-sfds" = {
            "name" = "view-client-sfds"
            "description" = ""
        },
        "view-client-swt" = {
            "name" = "view-client-swt"
            "description" = ""
        },
        "view-client-uci-sso" = {
            "name" = "view-client-uci-sso"
            "description" = ""
        },
        "view-client-webcaps" = {
            "name" = "view-client-webcaps"
            "description" = ""
        },
        "view-clients" = {
            "name" = "view-clients"
            "description" = ""
        },
        "view-events" = {
            "name" = "view-events"
            "description" = ""
        },
        "view-groups" = {
            "name" = "view-groups"
            "description" = ""
        },
        "view-metrics" = {
            "name" = "view-metrics"
            "description" = ""
        },
        "view-users" = {
            "name" = "view-users"
            "description" = ""
        },
    }
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
    add_to_id_token = true
    claim_name = "clientHost"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client Host"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientHost"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
    add_to_id_token = true
    claim_name = "clientId"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client ID"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientId"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
    add_to_id_token = true
    claim_name = "clientAddress"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client IP Address"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientAddress"
}
module "scope-mappings" {
    source = "../../../../modules/scope-mappings"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    client_id = keycloak_openid_client.CLIENT.id
    roles = {
        "realm-management/manage-users" = var.realm-management.ROLES["manage-users"].id,
        "realm-management/query-clients" = var.realm-management.ROLES["query-clients"].id,
        "realm-management/query-groups" = var.realm-management.ROLES["query-groups"].id,
        "realm-management/query-users" = var.realm-management.ROLES["query-users"].id,
        "realm-management/view-clients" = var.realm-management.ROLES["view-clients"].id,
        "realm-management/view-events" = var.realm-management.ROLES["view-events"].id,
        "realm-management/view-users" = var.realm-management.ROLES["view-users"].id,
    }
}
module "service-account-roles" {
    source = "../../../../modules/service-account-roles"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    client_id = keycloak_openid_client.CLIENT.id
    service_account_user_id = keycloak_openid_client.CLIENT.service_account_user_id
    realm_roles = {
        "offline_access" = "offline_access",
        "uma_authorization" = "uma_authorization",
    }
    client_roles = {
        "USER-MANAGEMENT-SERVICE/create-user" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "create-user"
        }
        "USER-MANAGEMENT-SERVICE/manage-user-details" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "manage-user-details"
        }
        "USER-MANAGEMENT-SERVICE/manage-user-groups" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "manage-user-groups"
        }
        "USER-MANAGEMENT-SERVICE/manage-user-roles" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "manage-user-roles"
        }
        "USER-MANAGEMENT-SERVICE/view-client-bcer-cp" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-bcer-cp"
        }
        "USER-MANAGEMENT-SERVICE/view-client-eacl" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-eacl"
        }
        "USER-MANAGEMENT-SERVICE/view-client-emcod" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-emcod"
        }
        "USER-MANAGEMENT-SERVICE/view-client-fmdb" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-fmdb"
        }
        "USER-MANAGEMENT-SERVICE/view-client-gis" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-gis"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hamis" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-hamis"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hcimweb" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-hcimweb"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hcimweb_hd2" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-hcimweb_hd2"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hem" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-hem"
        }
        "USER-MANAGEMENT-SERVICE/view-client-hscis" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-hscis"
        }
        "USER-MANAGEMENT-SERVICE/view-client-maid" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-maid"
        }
        "USER-MANAGEMENT-SERVICE/view-client-miwt" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-miwt"
        }
        "USER-MANAGEMENT-SERVICE/view-client-mspdirect-service" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-mspdirect-service"
        }
        "USER-MANAGEMENT-SERVICE/view-client-pidp-service" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-pidp-service"
        }
        "USER-MANAGEMENT-SERVICE/view-client-plr" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-plr"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sa-dbaac-portal" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sa-dbaac-portal"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sa-hibc-service-bc-portal" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sa-hibc-service-bc-portal"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sa-sfdc" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sa-sfdc"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sat-case-management-1" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sat-case-management-1"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sat-drug-management-1" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sat-drug-management-1"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sat-eforms" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sat-eforms"
        }
        "USER-MANAGEMENT-SERVICE/view-client-sfds" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-sfds"
        }
        "USER-MANAGEMENT-SERVICE/view-client-swt" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-swt"
        }
        "USER-MANAGEMENT-SERVICE/view-client-uci-sso" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-uci-sso"
        }
        "USER-MANAGEMENT-SERVICE/view-client-webcaps" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-client-webcaps"
        }
        "USER-MANAGEMENT-SERVICE/view-clients" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-clients"
        }
        "USER-MANAGEMENT-SERVICE/view-events" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-events"
        }
        "USER-MANAGEMENT-SERVICE/view-groups" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-groups"
        }
        "USER-MANAGEMENT-SERVICE/view-metrics" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-metrics"
        }
        "USER-MANAGEMENT-SERVICE/view-users" = {
            "client_id" = keycloak_openid_client.CLIENT.id,
            "role_id" = "view-users"
        }
        "account/manage-account" = {
            "client_id" = var.account.CLIENT.id,
            "role_id" = "manage-account"
        }
        "account/view-profile" = {
            "client_id" = var.account.CLIENT.id,
            "role_id" = "view-profile"
        }
        "realm-management/manage-users" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "manage-users"
        }
        "realm-management/view-clients" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "view-clients"
        }
        "realm-management/view-events" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "view-events"
        }
        "realm-management/view-users" = {
            "client_id" = var.realm-management.CLIENT.id,
            "role_id" = "view-users"
        }
    }
}
