resource "keycloak_realm_events" "realm_events" {
  realm_id = "moh_applications"

  events_enabled = true
  # There are 31,536,000 seconds in a year.
  events_expiration = 31536000

  admin_events_enabled         = true
  admin_events_details_enabled = true

  # When omitted or left empty, keycloak will enable all event types
  enabled_event_types = [
  ]

  events_listeners = [
    "jboss-logging", # keycloak enables the 'jboss-logging' event listener by default.
  ]
}