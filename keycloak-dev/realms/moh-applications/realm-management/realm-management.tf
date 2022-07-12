resource "keycloak_openid_client" "CLIENT" {
	access_type = "BEARER-ONLY"
	backchannel_logout_session_required = false
	base_url    = ""
	client_authenticator_type = "client-secret"
	client_id   = "realm-management"
	consent_required = false
	description = ""
	direct_access_grants_enabled = false
	enabled = true
	frontchannel_logout_enabled = false
	full_scope_allowed          = false
	implicit_flow_enabled       = false
	name = "Realm Management"
	realm_id = "moh_applications"
	service_accounts_enabled =false
	standard_flow_enabled = true
	use_refresh_tokens = false
	valid_redirect_uris = [
	]
	web_origins = [	]
	admin_url   = ""
}
module "client-roles" {
	source = "../../../../modules/client-roles"
	client_id = keycloak_openid_client.CLIENT.id
	realm_id = keycloak_openid_client.CLIENT.realm_id
	roles = {
		"manage-users" = {
			"name"        = "manage-users"
			"description" = format("%s%s","$","{role_manage-users}")
			composite_roles = []
		},
		"manage-identity-providers" = {
			"name"        = "manage-identity-providers"
			"description" = format("%s%s","$","{role_manage-identity-providers}")
			composite_roles = []
		},
		"manage-events" = {
			"name"        = "manage-events"
			"description" = format("%s%s","$","{role_manage-events}")
			composite_roles = []
		},
		"query-clients" = {
			"name"        = "query-clients"
			"description" = format("%s%s","$","{role_query-clients}")
			composite_roles = []
		},
		"query-users" = {
			"name"        = "query-users"
			"description" = format("%s%s","$","{role_query-users}")
			composite_roles = []
		},
		"view-users" = {
			"name"        = "view-users"
			"description" = format("%s%s","$","{role_view-users}")
            "composite_roles" = [
				"dc7a93f3-671d-45dc-a813-d6a0f3e9ee00",
				"bd9c60ca-63fa-4bf8-ab51-935ae4ca0d12"
			]
		},
		"manage-clients" = {
			"name"        = "manage-clients"
			"description" = format("%s%s","$","{role_manage-clients}")
			composite_roles = []
		},
		"view-realm" = {
			"name"        = "view-realm"
			"description" = format("%s%s","$","{role_view-realm}")
			composite_roles = []
		},
		"manage-realm" = {
			"name"        = "manage-realm"
			"description" = format("%s%s","$","{role_manage-realm}")
			composite_roles = []
		},
		"impersonation" = {
			"name"        = "impersonation"
			"description" = format("%s%s","$","{role_impersonation}")
			composite_roles = []
		},
		"view-authorization" = {
			"name"        = "view-authorization"
			"description" = format("%s%s","$","{role_view-authorization}")
			composite_roles = []
		},
		"view-identity-providers" = {
			"name"        = "view-identity-providers"
			"description" = format("%s%s","$","{role_view-identity-providers}")
			composite_roles = []
		},
		"query-groups" = {
			"name"        = "query-groups"
			"description" = format("%s%s","$","{role_query-groups}")
			composite_roles = []
		},
		"create-client" = {
			"name"        = "create-client"
			"description" = format("%s%s","$","{role_create-client}")
			composite_roles = []
		},
		"realm-admin" = {
			"name"        = "realm-admin"
			"description" = format("%s%s","$","{role_realm-admin}")
            "composite_roles" = [
				"6d3d0117-96d3-4488-ae02-0188d3f8f6f9",
				"ff83f3cd-235a-4010-9a5d-46860558ffa1",
				"5cfb7e82-cc87-47ce-94d0-cf6c90c3a3d6",
				"f3622592-630f-490c-82c0-f7fb1d3cd4d1",
				"dc7a93f3-671d-45dc-a813-d6a0f3e9ee00",
				"c8a99cd9-9976-44a7-9568-51deeb1e1eea",
				"7a1f2eef-474d-4435-9961-ab42ed0c5f94",
				"35f9e14c-9a0b-414a-a7c3-fe922ec3fe5b",
				"e7803d5a-b7e1-48bc-b8cb-f465c3a09e11",
				"fa23865b-7b01-4479-b28b-d14a1d4b4563",
				"25f8cbcd-74fa-4f55-bfc7-2e6bbcbe84ad",
				"bd9c60ca-63fa-4bf8-ab51-935ae4ca0d12",
				"66c4ac86-3097-4ca2-a0d4-32559ba28a8f",
				"d50255df-43b4-4b05-9439-72c953ecbbda",
				"d761d764-9449-4ece-9654-cbc0502ed835",
				"644d3737-bff6-419d-97c5-fef873aa2483",
				"b88b4706-ecbc-4400-af16-ea8d5b989d98",
				"7b8300eb-48db-48ae-978a-7d32bbb148de",
			]
		},
		"query-realms" = {
			"name"        = "query-realms"
			"description" = format("%s%s","$","{role_query-realms}")
			composite_roles = []
		},
		"view-clients" = {
			"name"        = "view-clients"
			"description" = format("%s%s","$","{role_view-clients}")
            "composite_roles" = [
				"644d3737-bff6-419d-97c5-fef873aa2483",
			]
		},
		"view-events" = {
			"name"        = "view-events"
			"description" = format("%s%s","$","{role_view-events}")
			composite_roles = []
		},
		"manage-authorization" = {
			"name"        = "manage-authorization"
			"description" = format("%s%s","$","{role_manage-authorization}")
			composite_roles = []
		},
	}
}


resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client ID"
	claim_name = "clientId"
	claim_value_type = "String"
	session_note = "clientId"
	add_to_id_token = true
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client Host"
	claim_name = "clientHost"
	claim_value_type = "String"
	session_note = "clientHost"
	add_to_id_token = true
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
	realm_id  = keycloak_openid_client.CLIENT.realm_id
	client_id = keycloak_openid_client.CLIENT.id
	name = "Client IP Address"
	claim_name = "clientAddress"
	claim_value_type = "String"
	session_note = "clientAddress"
	add_to_id_token = true
}


output "CLIENT" {
  value = keycloak_openid_client.CLIENT
}
output "ROLES" {
  value = module.client-roles.ROLES
}