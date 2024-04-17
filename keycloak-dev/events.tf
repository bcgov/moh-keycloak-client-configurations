locals {
  event_types = [
    "CLIENT_LOGIN",
    "CLIENT_LOGIN_ERROR",
    "CODE_TO_TOKEN",
    "CODE_TO_TOKEN_ERROR",
    "IMPERSONATE",
    "INTROSPECT_TOKEN",
    "INTROSPECT_TOKEN_ERROR",
    "LOGIN",
    "LOGIN_ERROR",
    "LOGOUT",
    "LOGOUT_ERROR",
    "REFRESH_TOKEN",
    "REFRESH_TOKEN_ERROR",
    "REGISTER",
    "USER_INFO_REQUEST",
    "VALIDATE_ACCESS_TOKEN",
    "VALIDATE_ACCESS_TOKEN_ERROR"
  ],
  seconds_in_a_year = 31536000
}

######################
# APPLICATION REALMS #
######################

resource "keycloak_realm_events" "realm_events_bcerd" {
  realm_id = "bcerd"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_lra" {
  realm_id = "lra"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_master" {
  realm_id = "master"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_mhsu_foundry" {
  realm_id = "mhsu_foundry"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_moh_applications" {
  realm_id = "moh_applications"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_moh_citizen" {
  realm_id = "moh_citizen"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_pidp_sandbox" {
  realm_id = "pidp_sandbox"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_v2_pos" {
  realm_id = "v2_pos"

  events_enabled = true
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

##############
# IDP REALMS #
##############

resource "keycloak_realm_events" "realm_events_bceid_basic" {
  realm_id = "bceid_basic"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_bceid_business" {
  realm_id = "bceid_business"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_bcprovider_aad" {
  realm_id = "bcprovider_aad"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_bcproviderlab_aad" {
  realm_id = "bcproviderlab_aad"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_bcsc" {
  realm_id = "bcsc"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_fnha_aad" {
  realm_id = "fnha_aad"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_idir" {
  realm_id = "idir"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_idir_aad" {
  realm_id = "idir_aad"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_mhsu_ehs" {
  realm_id = "mhsu_ehs"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_moh_idp" {
  realm_id = "moh_idp"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_phsa" {
  realm_id = "phsa"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}

resource "keycloak_realm_events" "realm_events_phsa_aad" {
  realm_id = "phsa_aad"

  events_enabled = false
  events_expiration = local.seconds_in_a_year

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = local.event_types

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}
